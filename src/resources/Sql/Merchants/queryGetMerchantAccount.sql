SELECT
    CCA.client_number,
    CCA.ACCT_NUMBER,
    cati.type_id
FROM BW3.cas_client_account CCA
LEFT JOIN BW3.CHT_ACCOUNT_TYPE_ID CATI
    ON CCA.ACCOUNT_TYPE_ID = CATI.INDEX_FIELD
    AND CCA.INSTITUTION_NUMBER = CATI.INSTITUTION_NUMBER
    AND CATI.LANGUAGE = 'USA'
WHERE CCA.institution_number= '00000003'
    and CCA.client_number = '11130200'
    and CATI.TYPE_ID = ?