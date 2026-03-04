# The name of this view in Looker is "Transaction Detail"
view: transaction_detail {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail.transaction_detail` ;;
  drill_fields: [transaction_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: transaction_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Channel ID" in Explore.

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: line_items {
    hidden: yes
    sql: ${TABLE}.line_items ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.store_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: transaction_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.transaction_timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [transaction_id, customers.last_name, customers.id, customers.first_name]
  }
}

# The name of this view in Looker is "Transaction Detail Line Items"
view: transaction_detail__line_items {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Gross Margin" in Explore.

  dimension: gross_margin {
    type: number
    sql: gross_margin ;;
  }

  dimension: product_id {
    type: number
    sql: product_id ;;
  }

  dimension: sale_price {
    type: number
    sql: sale_price ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: transaction_detail__line_items {
    type: string
    hidden: yes
    sql: transaction_detail__line_items ;;
  }
}
