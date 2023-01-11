# The name of this view in Looker is "Data Query"
view: data_query {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.data_query ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Content" in Explore.

  dimension: content {
    type: string
    sql: ${TABLE}."content" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: creator_id {
    type: string
    sql: ${TABLE}."creator_id" ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}."deleted" ;;
  }

  dimension: query_status_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."query_status_id" ;;
  }

  dimension: source_data_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."source_data_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}."updated_by" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, source_data.id, query_status.id, query_status.name]
  }
}
