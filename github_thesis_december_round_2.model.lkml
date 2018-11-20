connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: github_thesis_december_round_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: github_thesis_december_round_2_default_datagroup

explore: commits {
  join: commits__trailer {
    view_label: "Commits: Trailer"
    sql: LEFT JOIN UNNEST(${commits.trailer}) as commits__trailer ;;
    relationship: one_to_many
  }

  join: commits__committer {
    view_label: "Commits: Committer"
    sql: LEFT JOIN UNNEST([${commits.committer}]) as commits__committer ;;
    relationship: one_to_one
  }

  join: commits__author {
    view_label: "Commits: Author"
    sql: LEFT JOIN UNNEST([${commits.author}]) as commits__author ;;
    relationship: one_to_one
  }

  join: commits__difference {
    view_label: "Commits: Difference"
    sql: LEFT JOIN UNNEST(${commits.difference}) as commits__difference ;;
    relationship: one_to_many
  }
}

explore: languages {
  join: languages__language {
    view_label: "Languages: Language"
    sql: LEFT JOIN UNNEST(${languages.language}) as languages__language ;;
    relationship: one_to_many
  }
}

explore: licenses {}
