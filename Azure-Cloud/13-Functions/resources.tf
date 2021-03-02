


locals { 
  time = formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
}

locals { 
  timenow = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

output "fmttime"{ 
  value  = local.time
}

output "timenow"{ 
  value  = local.timenow
}
