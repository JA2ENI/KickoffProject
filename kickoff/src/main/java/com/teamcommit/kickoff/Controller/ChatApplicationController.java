package com.teamcommit.kickoff.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamcommit.kickoff.Do.ChatRoom;

@Controller
public class ChatApplicationController {
    
 
    @Autowired
    private SimpMessagingTemplate simpMessage;
    
    // @Autowired
    // private ChatRoomService chatRoomService;
 
    //채팅으로 거래하기(productInfo 화면)
    @RequestMapping(value="/chatMessage", method=RequestMethod.GET)
    public String getWebSocketWithSockJs(Model model, HttpSession session, 
            @ModelAttribute("chatRoom") ChatRoom chatRoom) throws IOException {
        
        //productInfo화면에서 Chat화면에 전달해줄 parameter
        
        String login = (String) session.getAttribute("userId");
        chatRoom.setSendId(login);
        
        
        //이미 chatRoom이 만들어져있는지 확인
        /*if (chatRoomService.countByChatId(chatRoom.getSendId()) > 0) {
            //get ChatRoomInfo
            ChatRoom chatRoomTemp = chatRoomService.findByChatId(chatRoom.getSendId());
            //load existing chat history
            List<ChatRoom> chatHistory = chatRoomService.readChatHistory(chatRoomTemp);
            //transfer chatHistory Model to View
            model.addAttribute("chatHistory", chatHistory);
            
        } el
            //chatRoom 생성            
            chatRoomService.addChatRoom(chatRoom);            
            //text file 생성
            chatRoomService.createFile(chatRoom.getPr_id(), chatRoomService.getId(chatRoom.getPr_id(), chatRoom.getBuyerId()));                                
        }
 
            //chatRoom Add 시 생성될 chatId
            chatRoom.setId(chatRoomService.getId(chatRoom.getPr_id(), chatRoom.getBuyerId()));
            
            //chatRoom 객체 Model에 저장해 view로 전달
            model.addAttribute("chatRoomInfo", chatRoom);*/
        
        return "chatBroadcastProduct";
    }
}    
