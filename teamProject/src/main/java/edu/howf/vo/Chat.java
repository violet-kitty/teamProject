package edu.howf.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//@NoArgsConstructor
//@AllArgsConstructor
@ToString
public class Chat implements Serializable{
	
	private int no;
	private String memberId;
	private int srNo;
	private String chatContent;
	private Date sendDate;
	
	private String vaildYN;
}
	
	
	


