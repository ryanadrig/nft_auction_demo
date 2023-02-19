

// return endtime for counter from formatted string
int ret_counter_endtime(String et_str){
  int hours = int.parse(et_str.split(":")[0]);
  int minutes = int.parse(et_str.split(":")[1]);
  int seconds = int.parse(et_str.split(":")[2]);
  int endtime = DateTime.now().millisecondsSinceEpoch + (1000 * seconds)
      + (60000 * minutes) + (3600000 * hours);
  return endtime;
}