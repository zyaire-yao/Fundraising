package com.fund.model.fundreply.dao;

import java.util.List;

import com.fund.model.eneity.FundReply;

public interface IFundReplyDao {

	void addFundReply(FundReply fundReply);

	List<FundReply> findAllFundReplyByStoreId(Integer storeId);

	List<FundReply> listFindFundReplyByFundProductId(Integer fundProductId);

}
