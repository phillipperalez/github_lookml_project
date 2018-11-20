view: commits {
  sql_table_name: github_data.commits ;;

  dimension: author {
    hidden: yes
    sql: ${TABLE}.author ;;
  }

  dimension: commit {
    type: string
    sql: ${TABLE}.commit ;;
  }

  dimension: committer {
    hidden: yes
    sql: ${TABLE}.committer ;;
  }

  dimension: difference {
    hidden: yes
    sql: ${TABLE}.difference ;;
  }

  dimension: difference_truncated {
    type: yesno
    sql: ${TABLE}.difference_truncated ;;
  }

  dimension: encoding {
    type: string
    sql: ${TABLE}.encoding ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}.parent ;;
  }

  dimension: repo_name {
    type: string
    sql: ${TABLE}.repo_name ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: trailer {
    hidden: yes
    sql: ${TABLE}.trailer ;;
  }

  dimension: tree {
    type: string
    sql: ${TABLE}.tree ;;
  }

  measure: count {
    type: count
    drill_fields: [repo_name]
  }
}

view: commits__trailer {
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: commits__committer {
  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: time_sec {
    type: number
    sql: ${TABLE}.time_sec ;;
  }

  dimension: tz_offset {
    type: number
    sql: ${TABLE}.tz_offset ;;
  }
}

view: commits__author {
  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: time_sec {
    type: number
    sql: ${TABLE}.time_sec ;;
  }

  dimension: tz_offset {
    type: number
    sql: ${TABLE}.tz_offset ;;
  }
}

view: commits__difference {
  dimension: new_mode {
    type: number
    sql: ${TABLE}.new_mode ;;
  }

  dimension: new_path {
    type: string
    sql: ${TABLE}.new_path ;;
  }

  dimension: new_repo {
    type: string
    sql: ${TABLE}.new_repo ;;
  }

  dimension: new_sha1 {
    type: string
    sql: ${TABLE}.new_sha1 ;;
  }

  dimension: old_mode {
    type: number
    sql: ${TABLE}.old_mode ;;
  }

  dimension: old_path {
    type: string
    sql: ${TABLE}.old_path ;;
  }

  dimension: old_repo {
    type: string
    sql: ${TABLE}.old_repo ;;
  }

  dimension: old_sha1 {
    type: string
    sql: ${TABLE}.old_sha1 ;;
  }
}
