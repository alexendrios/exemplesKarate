 select
    it.transaction_slip,
    it.MERCHANT_NUMBER,
    it.terminal_id,
    it.tran_amount_gr,
    it.retrieval_reference,
    it.transaction_date,
    it.auth_code
 from bw3.cht_transaction_type ctt
    left join bw3.int_transactions it on it.TRANSACTION_TYPE = ctt.INDEX_FIELD
    and ctt.INSTALLMENT_GROUP is null
    and ctt.LANGUAGE = 'USA'
    left join bw3.VIEW_RELATED_TRAN_STATUS rts on it.transaction_slip = rts.transaction_slip
    and rts.related_transaction_status <> 406
 where it.transaction_class = '002'
    and it.transaction_status in ('007','009')
    and it.institution_number = '00000003'
    and it.transaction_destination = ?
    and it.transaction_date = ?
    and it.reversal_flag = '000'
    and it.dr_cr_indicator = '002'
    and it.tran_amount_gr BETWEEN '900.01' and '999.00'
    and it.MERCHANT_NUMBER = '11130200'
    and not exists (select ibc.number_original_slip from bw3.INT_BATCH_CAPTURE ibc
            where ibc.institution_number = it.institution_number
            and ibc.number_original_slip = it.transaction_slip)