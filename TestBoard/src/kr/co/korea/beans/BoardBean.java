package kr.co.korea.beans;

import java.util.*;

public class BoardBean {
	private int Test_BNO;
	private String Test_TITLE;
	private String Test_CONTENT;
	private String Test_WRITER;
	private int Test_hit;
	private Date REGDATE;
	
	
	public int getTest_BNO() {
		return Test_BNO;
	}
	public void setTest_BNO(int test_BNO) {
		Test_BNO = test_BNO;
	}
	public String getTest_TITLE() {
		return Test_TITLE;
	}
	public void setTest_TITLE(String test_TITLE) {
		Test_TITLE = test_TITLE;
	}
	public String getTest_CONTENT() {
		return Test_CONTENT;
	}
	public void setTest_CONTENT(String test_CONTENT) {
		Test_CONTENT = test_CONTENT;
	}
	public String getTest_WRITER() {
		return Test_WRITER;
	}
	public void setTest_WRITER(String test_WRITER) {
		Test_WRITER = test_WRITER;
	}
	public int getTest_hit() {
		return Test_hit;
	}
	public void setTest_hit(int test_hit) {
		Test_hit = test_hit;
	}
	public Date getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Date rEGDATE) {
		REGDATE = rEGDATE;
	}
	
}
