# The name of this view in Looker is "Events"
view: events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `retail.events` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Browser" in Explore.

  dimension: browser {
    type: string
    sql: ${TABLE}.BROWSER ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.EVENT_TYPE ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.IP_ADDRESS ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.OS ;;
  }

  dimension: sequence_number {
    type: number
    sql: ${TABLE}.SEQUENCE_NUMBER ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.SESSION_ID ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.TRAFFIC_SOURCE ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.URI ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.USER_ID ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.ZIP ;;
  }
  measure: count {
    type: count
  }
}
