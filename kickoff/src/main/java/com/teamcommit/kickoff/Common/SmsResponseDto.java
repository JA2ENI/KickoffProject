package com.teamcommit.kickoff.Common;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder
public class SmsResponseDto {
	
    private String requestId;
	private LocalDateTime requestTime;
    private String statusCode;
    private String statusName;
    private String smsConfirmNum;
    
	public void setSmsConfirmNum(String smsConfirmNum) {
		this.smsConfirmNum = smsConfirmNum;
	}
    

    
}
