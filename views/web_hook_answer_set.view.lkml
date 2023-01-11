# The name of this view in Looker is "Web Hook Answer Set"
view: web_hook_answer_set {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.web_hook_answer_set ;;
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
  # This dimension will be called "Answers" in Explore.

  dimension: answers {
    type: string
    sql: ${TABLE}."answers" ;;
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

  dimension: descriptions {
    type: string
    sql: ${TABLE}."descriptions" ;;
  }

  dimension: finalized {
    type: yesno
    sql: ${TABLE}."finalized" ;;
  }

  dimension: flow_label {
    type: string
    sql: ${TABLE}."flow_label" ;;
  }

  dimension: responder_uuid {
    type: string
    sql: ${TABLE}."responder_uuid" ;;
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

  dimension: variant_label {
    type: string
    sql: ${TABLE}."variant_label" ;;
  }

  dimension: variant_uuid {
    type: string
    sql: ${TABLE}."variant_uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, pending_data_changes.count, pi_signature.count, source_data.count]
  }
}
