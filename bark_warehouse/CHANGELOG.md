# Changelog

## v1.4.1
- fixed schema bug for marts tables.

## v1.4.0
- added fact_orders and fact_orders_line_items
- changed int_orders_line_items.order_date to order_timestamp

## v1.3.0
- changed operating_expenses to non_sku_purchases
- changed purchase_source and item_source columns to purchase_type and item_type

## v1.2.0
- added int_orders_line_items

## v1.1.3
- changed direct_sales.sku_id to purchase_id and added purchase_source

## v1.1.2
- changed shopee_sales.sku_id to purchase_id and added purchase_source

## v1.1.1
- changed shopee_sales.net_income to net_revenue
- fixed manifest handling

## v1.1.0
- added warehouse structure (staging, ints, marts)
- added 12 staging tables for gsheets sources
- added yml file and tests

## v1.0.1
- added github worflow and pull request template
- added seed tables for gsheets
- repo cleanup

## v1.0.0
- initialized warehouse
- initialized dbt project
- configured Postgres connection
- set up repo structure
- added version pinning
