view: languages {
  sql_table_name: github_data.languages ;;

  dimension: language {
    hidden: yes
    sql: ${TABLE}.language ;;
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

view: languages__language {
  dimension: bytes {
    type: number
    sql: ${TABLE}.bytes ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
