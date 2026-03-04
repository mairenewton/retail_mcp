# The name of this view in Looker is "Inventory Items"
view: inventory_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail.inventory_items` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cost" in Explore.

  dimension: cost {
    type: number
    sql: ${TABLE}.COST ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.PRODUCT_BRAND ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.PRODUCT_DEPARTMENT ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.PRODUCT_DISTRIBUTION_CENTER_ID ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.PRODUCT_ID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.PRODUCT_NAME ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.PRODUCT_RETAIL_PRICE ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.PRODUCT_SKU ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.SOLD_AT ;;
  }
  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
