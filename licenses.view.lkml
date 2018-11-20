view: licenses {
  sql_table_name: github_data.licenses ;;

  dimension: license {
    type: string
    sql: ${TABLE}.license ;;
  }

  dimension: repo_name {
    type: string
    sql: ${TABLE}.repo_name ;;
  }

  measure: count {
    type: count
    drill_fields: [repo_name]
  }
}
