package com.spring.kgstudy.seat.vo;

public class SeatVO {
	
	private int seatId;
	private String seatName;
	private int storeId;
	private String userid;
	private String seatType;
	private int x;
	private int y;
	
	public SeatVO() {}
	public SeatVO(int seatId, String seatName, int storeId, String userid, String seatType, int x, int y) {
		super();
		this.seatId = seatId;
		this.seatName = seatName;
		this.storeId = storeId;
		this.userid = userid;
		this.seatType = seatType;
		this.x = x;
		this.y = y;
	}
	
	
	@Override
	public String toString() {
		return "SeatVO [seatId=" + seatId + ", seatName=" + seatName + ", storeId=" + storeId + ", userid=" + userid
				+ ", seatType=" + seatType + ", x=" + x + ", y=" + y + "]";
	}
	
	
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSeatType() {
		return seatType;
	}
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	
	
	
	
	
	
}
