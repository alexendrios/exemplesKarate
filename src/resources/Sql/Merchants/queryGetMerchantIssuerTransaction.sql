select
    t3.*
    from(
        select
            t2.MERCHANT_NUMBER,
            t2.terminal_id,
            t2.retrieval_reference,
            t2.transaction_date,
            t2.auth_code,
            sum(to_number(t2.tran_amount_gr)) tran_amount_gr,
            LISTAGG(has_Canceled, ':') WITHIN GROUP (ORDER BY has_Canceled, has_Canceled) has_Canceled
            from(
                Select
                    t.transaction_slip,
                    Max(t.MERCHANT_NUMBER) MERCHANT_NUMBER,
                    Max(t.terminal_id) terminal_id,
                    Max(t.tran_amount_gr) tran_amount_gr,
                    Max(t.retrieval_reference) retrieval_reference,
                    Max(t.transaction_date) transaction_date,
                    Max(t.auth_code) auth_code,
                    Max(t.has_Canceled) has_Canceled
                    from(
                        select
                            it.*,
                            case when (
                                select
                                    ibc.number_original_slip
                                    from bw3.INT_BATCH_CAPTURE ibc
                                    where ibc.institution_number = it.institution_number
                                    and ibc.number_original_slip = it.transaction_slip
                                ) is null
                            then 'NO'
                            else 'YES' end has_Canceled
                            from bw3.cht_transaction_type ctt
                                left join bw3.int_transactions it
                                    on it.TRANSACTION_TYPE = ctt.INDEX_FIELD
                                    and ctt.INSTALLMENT_GROUP = ?
                                    and ctt.LANGUAGE = 'USA'
                                left join bw3.VIEW_RELATED_TRAN_STATUS rts
                                    on it.transaction_slip = rts.transaction_slip
                                    and rts.related_transaction_status <> '406'
                            where it.transaction_class = '002'
                                and it.transaction_status in ('009','007')
                                and it.institution_number = '00000003'
                                and it.transaction_destination = ?
                                and it.reversal_flag = '000'
                                and it.dr_cr_indicator = '002'
                                and it.MERCHANT_NUMBER = '11130200'
                                and it.transaction_date = ?
                            ) t
                    group by t.transaction_slip
                    ) t2
                group by t2.MERCHANT_NUMBER, t2.terminal_id, t2.retrieval_reference, t2.transaction_date, t2.auth_code
                )t3
        where t3.tran_amount_gr BETWEEN '900.01' and '999.00'
            and t3.has_canceled not like '%YES%'
