package com.fund.model.member.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.fund.model.eneity.Assess;
import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Store;

public class MemberOutputVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3835540671055380761L;

	private int memberId;

	private String memberEmail;

	private String memberPwd;

	private String memberFname;

	private String memberSname;

	private String memberTwid;

	private String memberHb;

	private String memberGd;

	private String memberTel;

	private String memberCel;

	private String memberPic;

	private String memberCode;

	private String memberStatus;
	
	

	private Set<Store> stores = new HashSet<Store>();
	

	private Set<Order> orders = new HashSet<Order>();
	

	private Set<Msg> msgs = new HashSet<Msg>();
	

	private Set<Assess> assess = new HashSet<Assess>();
	

	private Set<FundOrder> fundOrders = new HashSet<FundOrder>();
	

	private Set<FundMsg> fundMsgs = new HashSet<FundMsg>();
	

	private	Set<Report>	reports	 = new HashSet<Report>	();


	public int getMemberId() {
		return memberId;
	}


	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberPwd() {
		return memberPwd;
	}


	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}


	public String getMemberFname() {
		return memberFname;
	}


	public void setMemberFname(String memberFname) {
		this.memberFname = memberFname;
	}


	public String getMemberSname() {
		return memberSname;
	}


	public void setMemberSname(String memberSname) {
		this.memberSname = memberSname;
	}


	public String getMemberTwid() {
		return memberTwid;
	}


	public void setMemberTwid(String memberTwid) {
		this.memberTwid = memberTwid;
	}


	public String getMemberHb() {
		return memberHb;
	}


	public void setMemberHb(String memberHb) {
		this.memberHb = memberHb;
	}


	public String getMemberGd() {
		return memberGd;
	}


	public void setMemberGd(String memberGd) {
		this.memberGd = memberGd;
	}


	public String getMemberTel() {
		return memberTel;
	}


	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}


	public String getMemberCel() {
		return memberCel;
	}


	public void setMemberCel(String memberCel) {
		this.memberCel = memberCel;
	}


	public String getMemberPic() {
		return memberPic;
	}


	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}


	public String getMemberCode() {
		return memberCode;
	}


	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}


	public String getMemberStatus() {
		return memberStatus;
	}


	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}


	public Set<Store> getStores() {
		return stores;
	}


	public void setStores(Set<Store> stores) {
		this.stores = stores;
	}


	public Set<Order> getOrders() {
		return orders;
	}


	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}


	public Set<Msg> getMsgs() {
		return msgs;
	}


	public void setMsgs(Set<Msg> msgs) {
		this.msgs = msgs;
	}


	public Set<Assess> getAssess() {
		return assess;
	}


	public void setAssess(Set<Assess> assess) {
		this.assess = assess;
	}


	public Set<FundOrder> getFundOrders() {
		return fundOrders;
	}


	public void setFundOrders(Set<FundOrder> fundOrders) {
		this.fundOrders = fundOrders;
	}


	public Set<FundMsg> getFundMsgs() {
		return fundMsgs;
	}


	public void setFundMsgs(Set<FundMsg> fundMsgs) {
		this.fundMsgs = fundMsgs;
	}


	public Set<Report> getReports() {
		return reports;
	}


	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
