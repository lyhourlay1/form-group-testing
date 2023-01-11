# The name of this view in Looker is "Source Data"
view: source_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.source_data ;;
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
  # This dimension will be called "Answer" in Explore.

  dimension: answer {
    type: string
    sql: ${TABLE}."answer" ;;
  }

  dimension: answer_type {
    type: string
    sql: ${TABLE}."answer_type" ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: form_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."form_id" ;;
  }

  dimension: formsort_question_key {
    type: string
    sql: ${TABLE}."formsort_question_key" ;;
  }

  dimension: group_label {
    type: string
    sql: ${TABLE}."group_label" ;;
  }

  dimension: locked {
    type: yesno
    sql: ${TABLE}."locked" ;;
  }

  dimension: pi_signature_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."pi_signature_id" ;;
  }

  dimension: prior_answer {
    type: string
    sql: ${TABLE}."prior_answer" ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}."question" ;;
  }

  dimension: source_status_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."source_status_id" ;;
  }

  dimension: subject_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."subject_id" ;;
  }

  dimension: update_reason {
    type: string
    sql: ${TABLE}."update_reason" ;;
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

  dimension: validated {
    type: yesno
    sql: ${TABLE}."validated" ;;
  }

  dimension: web_hook_answer_set_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."web_hook_answer_set_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      pi_signature.form_name,
      pi_signature.id,
      web_hook_answer_set.id,
      subject.id,
      source_status.name,
      source_status.id,
      form.id,
      form.name,
      data_query.count,
      pending_data_change.count
    ]
  }
}
