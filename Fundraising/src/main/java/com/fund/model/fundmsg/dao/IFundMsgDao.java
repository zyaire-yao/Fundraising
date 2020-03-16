package com.fund.model.fundmsg.dao;

import java.util.List;

import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.Msg;



public interface IFundMsgDao {

	void addFundMsg(FundMsg fundMsg);

	List<FundMsg> listFindFundMsgByFundProductId(Integer fundProductId);

	FundMsg findFundMsgByFundMsgId(Integer fundMsgId);

	List<FundMsg> listFindAllFundMsgByStoreId(Integer storeId);

	
	
}
