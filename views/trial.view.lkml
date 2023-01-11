# The name of this view in Looker is "Trial"
view: trial {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.trial ;;
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
  # This dimension will be called "Countries" in Explore.

  dimension: countries {
    type: string
    sql: ${TABLE}."countries" ;;
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

  dimension_group: kickoff_meeting {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."kickoff_meeting" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension_group: protocol_approval {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."protocol_approval" ;;
  }

  dimension: protocol_number {
    type: string
    sql: ${TABLE}."protocol_number" ;;
  }

  dimension: service_ctms {
    type: yesno
    sql: ${TABLE}."service_ctms" ;;
  }

  dimension: service_custom {
    type: string
    sql: ${TABLE}."service_custom" ;;
  }

  dimension: service_econsent {
    type: yesno
    sql: ${TABLE}."service_econsent" ;;
  }

  dimension: service_edc {
    type: yesno
    sql: ${TABLE}."service_edc" ;;
  }

  dimension: service_epro {
    type: yesno
    sql: ${TABLE}."service_epro" ;;
  }

  dimension: service_esource {
    type: yesno
    sql: ${TABLE}."service_esource" ;;
  }

  dimension: service_etmf {
    type: yesno
    sql: ${TABLE}."service_etmf" ;;
  }

  dimension: service_rtsm {
    type: yesno
    sql: ${TABLE}."service_rtsm" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date" ;;
  }

  dimension: target_patients {
    type: number
    sql: ${TABLE}."target_patients" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_target_patients {
    type: sum
    sql: ${target_patients} ;;
  }

  measure: average_target_patients {
    type: average
    sql: ${target_patients} ;;
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

  measure: count {
    type: count
    drill_fields: [id, name, clinic_trial.count, form.count, user_trial_assignment.count]
  }
}
