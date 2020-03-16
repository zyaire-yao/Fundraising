package com.fund.model.eneity;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "fund_programs")
public class FundProgram {
	@Id
	@Column(name = "fund_program_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fundProgramId;
	
	@Column(name = "fund_program_pic")
	private String fundProgramPicture;
	
	@Column(name = "fund_program_price")
	private int fundProgramPrice;
	
	@Column(name = "fund_program_last")
	private int fundProgramLast;
	
	@Column(name = "fund_program_pf")
	private String fundProgramPf;
	
	@ManyToOne
	@JoinColumn(name = "fund_product_id")
	private FundProduct fundProduct;

	public int getFundProgramId() {
		return fundProgramId;
	}

	public void setFundProgramId(int fundProgramId) {
		this.fundProgramId = fundProgramId;
	}

	public String getFundProgramPicture() {
		return fundProgramPicture;
	}

	public void setFundProgramPicture(String fundProgramPicture) {
		this.fundProgramPicture = fundProgramPicture;
	}

	public int getFundProgramPrice() {
		return fundProgramPrice;
	}

	public void setFundProgramPrice(int fundProgramPrice) {
		this.fundProgramPrice = fundProgramPrice;
	}

	public int getFundProgramLast() {
		return fundProgramLast;
	}

	public void setFundProgramLast(int fundProgramLast) {
		this.fundProgramLast = fundProgramLast;
	}

	public String getFundProgramPf() {
		return fundProgramPf;
	}

	public void setFundProgramPf(String fundProgramPf) {
		this.fundProgramPf = fundProgramPf;
	}

	public FundProduct getFundProduct() {
		return fundProduct;
	}

	public void setFundProduct(FundProduct fundProduct) {
		this.fundProduct = fundProduct;
	}
}
	