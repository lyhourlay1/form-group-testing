# The name of this view in Looker is "Vendor Type"
view: vendor_type {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.vendor_type ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Description" in Explore.

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
