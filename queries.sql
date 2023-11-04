-- revenue from Apr 2023 campaign

with bans as
(select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.apr2023final`)
select sum(B.REV_MRC_F_ROAM_Easy)  from bans A
left join `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` B
ON A.BAN = B.BAN
where B.CCYYMM = 202304
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'

-- revenue from June 2023 campaign

with bans as
(select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.jun2023final`)
select sum(B.REV_MRC_F_ROAM_Easy)  from bans A
left join `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` B
ON A.BAN = B.BAN
where B.CCYYMM = 202306
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'

-- revenue from July 2023 campaign

with bans as
(select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.jul2023final`)
select sum(B.REV_MRC_F_ROAM_Easy)  from bans A
left join `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` B
ON A.BAN = B.BAN
where B.CCYYMM = 202307
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'

-- revenue from Aug 2023 campaign

with bans as
(select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.aug2023final`)
select sum(B.REV_MRC_F_ROAM_Easy)  from bans A
left join `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` B
ON A.BAN = B.BAN
where B.CCYYMM = 202308
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'

-- revenue from Sep 2023 campaign

with bans as
(select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.sep2023final`)
select sum(B.REV_MRC_F_ROAM_Easy)  from bans A
left join `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` B
ON A.BAN = B.BAN
where B.CCYYMM = 202309
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'

with jun_50pile as (
select ban from `bi-srv-aaaie-pr-c0c268.roaming_pr.bq_smb_traveler_roaming`
where dl_vol_percentile >= 30
and aggregated_from = '2023-06-01')
select sum(b.REV_MRC_F_ROAM_Easy) from jun_50pile as a
left join `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` as b
on a.ban = b.BAN
where b.CCYYMM = 202307
AND b.SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'
