package com.shop.app.notification.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.shop.app.notification.entity.Notification;
import com.shop.app.notification.repository.NotificationRepository;
import com.shop.app.order.entity.Order;
import com.shop.app.order.repository.OrderRepository;
import com.shop.app.payment.dto.PaymentCompleteNotificationDto;

@Service
public class NotificationServiceImpl implements NotificationService {
   @Autowired
   NotificationRepository notificationRepository;

   @Autowired
   SimpMessagingTemplate simpMessagingTemplate;

   @Autowired
   OrderRepository orderRepository;

   /**
    
실시간알림
notification db 저장
*/
@Override
public int updateOrderStatusNotification() {
 // 실시간 알림을 보낸다.
 // 1. 작성자의 구독자 조회
 // 2. 각 사용자에게 알림메세지 발송(stomp)
 int result = 0;
 List<Order> orders = orderRepository.findOrdersWithExpiredStatus();
 for (Order order : orders) {

    String to = order.getMemberId();
      Notification notification = Notification.builder()
          .id(order.getOrderId())
          .notiCategory(3)
          .notiContent(order.getOrderNo() + "번 주문이 구매확정되었습니다.")
          .notiCreatedAt(new Timestamp(System.currentTimeMillis()))
          .memberId(to) 
          .build();
    simpMessagingTemplate.convertAndSend("/pet/notice/" + to, notification);

    result = notificationRepository.insertNotification(notification);
 }
 return result;
}

@Override
public int paymentCompleteNotification(PaymentCompleteNotificationDto paymentCompleteNotificationDto) {

 String to = paymentCompleteNotificationDto.getMemberId();
 Notification notification = Notification.builder()
      .id(paymentCompleteNotificationDto.getOrderId())
      .notiCategory(1)
      .notiContent(paymentCompleteNotificationDto.getProductName() + "상품 주문완료 되었습니다.")
      .notiCreatedAt(new Timestamp(System.currentTimeMillis()))
      .memberId(to) 
      .build();

 return notificationRepository.insertNotification(notification);
}

@Override // db에서 알림 가져오기
public List<Notification> findAllNotification(String memberId) {
  List<Notification> notifications = notificationRepository.findAllNotification(memberId);
  if (notifications == null) {
      return Collections.emptyList();
  }
  return notifications;
}

private String formatTimestamp(Timestamp timestamp) {
   SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
   return dateFormat.format(timestamp);}

@Override
public int deleteNotification(int id) {
	// TODO Auto-generated method stub
	return 0;
}
}