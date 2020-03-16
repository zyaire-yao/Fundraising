package com.fund.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "fund_msgs")
public class FundMsg {
	@Id
	@Column(name = "fund_msg_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fundMsgId;
	
	@Column(name = "fund_msg_tital")
	private String fundMsgTital;
	
	@Column(name = "fund_msg_pf")
	private String fundMsgPf;
	
	@Column(name = "fund_msg_pic")
	private String fundMsgPic;
	
	@Column(name = "fund_msg_date")
	private Date fundMsgDate;
	
	@ManyToOne
	@JoinColumn(name = "member_id")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "fund_product_id")
	private FundProduct funProduct;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "fundMsg", cascade = CascadeType.ALL)
	private Set<FundReply> fundReply = new HashSet<FundReply>();

	public int getFundMsgId() {
		return fundMsgId;
	}

	public void setFundMsgId(int fundMsgId) {
		this.fundMsgId = fundMsgId;
	}

	public String getFundMsgTital() {
		return fundMsgTital;
	}

	public void setFundMsgTital(String fundMsgTital) {
		this.fundMsgTital = fundMsgTital;
	}

	public String getFundMsgPf() {
		return fundMsgPf;
	}

	public void setFundMsgPf(String fundMsgPf) {
		this.fundMsgPf = fundMsgPf;
	}



	public String getFundMsgPic() {
		return fundMsgPic;
	}

	public void setFundMsgPic(String fundMsgPic) {
		this.fundMsgPic = fundMsgPic;
	}

	public Date getFundMsgDate() {
		return fundMsgDate;
	}

	public void setFundMsgDate(Date fundMsgDate) {
		this.fundMsgDate = fundMsgDate;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public FundProduct getFunProduct() {
		return funProduct;
	}

	public void setFunProduct(FundProduct funProduct) {
		this.funProduct = funProduct;
	}

	public Set<FundReply> getFundReply() {
		return fundReply;
	}

	public void setFundReply(Set<FundReply> fundReply) {
		this.fundReply = fundReply;
	}

}
