-- revenue from Apr 2023 campaign
--msidn instead of ban


with apr_rev as (
select BAN, MOBILE_PHONE_NUMBER as MSISDN, REV_MRC_F_ROAM_Easy as rev from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue`
where CCYYMM = 202304
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%')
select count(distinct(apr_rev.MSISDN)) as total_users,
      sum(apr_rev.rev) as roaming_revenue
from apr_rev
where apr_rev.BAN in (select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.apr2023final`)

-- revenue from June 2023 campaign


with june_rev as (
select BAN, MOBILE_PHONE_NUMBER as MSISDN, REV_MRC_F_ROAM_Easy as rev from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue`
where CCYYMM = 202306
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%')
select count(distinct(june_rev.MSISDN)) as total_users,
      sum(june_rev.rev) as roaming_revenue
from june_rev
where june_rev.BAN in (select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.jun2023final`)

-- revenue from July 2023 campaign


with june_rev as (
select BAN, MOBILE_PHONE_NUMBER as MSISDN, REV_MRC_F_ROAM_Easy as rev from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue`
where CCYYMM = 202306
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%')
select count(distinct(june_rev.MSISDN)) as total_users,
      sum(june_rev.rev) as roaming_revenue
from june_rev
where june_rev.BAN in (select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.jun2023final`)

-- revenue from Aug 2023 campaign

with aug_rev as (
select BAN, MOBILE_PHONE_NUMBER as MSISDN, REV_MRC_F_ROAM_Easy as rev from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue`
where CCYYMM = 202308
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%')
select count(distinct(aug_rev.MSISDN)) as total_users,
      sum(aug_rev.rev) as roaming_revenue
from aug_rev
where aug_rev.BAN in (select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.aug2023final`)

-- revenue from Sep 2023 campaign

with sep_rev as (
select BAN, MOBILE_PHONE_NUMBER as MSISDN, REV_MRC_F_ROAM_Easy as rev from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue`
where CCYYMM = 202309
AND SEGMENT_ROLLUP_2_CUR LIKE '%SMB%')
select count(distinct(sep_rev.MSISDN)) as total_users,
      sum(sep_rev.rev) as roaming_revenue
from sep_rev
where sep_rev.BAN in (select distinct(BAN) from `wb-ai-acltr-tbs-1-pr-cb6990.smb_roaming_campaign.sep2023final`)







-- HIGH PROPENSITY SCORES

-- April 2023
select count(distinct(MOBILE_PHONE_NUMBER)) as high_prop_users,sum(REV_MRC_F_ROAM_Easy) as high_prop_revenue from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` b
where b.CCYYMM = 202304
AND b.SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'
and b.ban in (select distinct(ban) from `bi-srv-aaaie-pr-c0c268.roaming_pr.bq_smb_traveler_roaming`
where aggregated_from = '2023-06-01'
and dl_vol_percentile >= 50)

-- June 2023
select count(distinct(MOBILE_PHONE_NUMBER)) as high_prop_users,sum(REV_MRC_F_ROAM_Easy) as high_prop_revenue from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` b
where b.CCYYMM = 202306
AND b.SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'
and b.ban in (select distinct(ban) from `bi-srv-aaaie-pr-c0c268.roaming_pr.bq_smb_traveler_roaming`
where aggregated_from = '2023-06-01'
and dl_vol_percentile >= 50)

-- July 2023
select count(distinct(MOBILE_PHONE_NUMBER)) as high_prop_users,sum(REV_MRC_F_ROAM_Easy) as high_prop_revenue from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` b
where b.CCYYMM = 202307
AND b.SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'
and b.ban in (select distinct(ban) from `bi-srv-aaaie-pr-c0c268.roaming_pr.bq_smb_traveler_roaming`
where aggregated_from = '2023-07-01'
and dl_vol_percentile >= 50)

-- August 2023
select count(distinct(MOBILE_PHONE_NUMBER)) as high_prop_users,sum(REV_MRC_F_ROAM_Easy) as high_prop_revenue from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` b
where b.CCYYMM = 202308
AND b.SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'
and b.ban in (select distinct(ban) from `bi-srv-aaaie-pr-c0c268.roaming_pr.bq_smb_traveler_roaming`
where aggregated_from = '2023-08-01'
and dl_vol_percentile >= 50)

-- Sept 2023
select count(distinct(MOBILE_PHONE_NUMBER)) as high_prop_users,sum(REV_MRC_F_ROAM_Easy) as high_prop_revenue from `wb-ai-acltr-tbs-1-pr-cb6990.ref_table.pricing_wls_network_revenue` b
where b.CCYYMM = 202309
AND b.SEGMENT_ROLLUP_2_CUR LIKE '%SMB%'
and b.ban in (select distinct(ban) from `bi-srv-aaaie-pr-c0c268.roaming_pr.bq_smb_traveler_roaming`
where aggregated_from = '2023-09-01'
and dl_vol_percentile >= 50)
