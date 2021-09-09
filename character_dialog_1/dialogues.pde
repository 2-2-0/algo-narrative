/*
  character_dialog_1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  */

class DialogManager {
  JSONObject conversations_source;
  JSONArray fixed_dialogs;
  JSONArray multiple_responses;
  JSONArray dimensional_dialogs;
  
  DialogManager () {
    // load conversations JSON file
    this.conversations_source = loadJSONObject ("conversations.json");
    // extract fixed dialogs
    this.fixed_dialogs = conversations_source.getJSONArray ("fixedDialogs");
    // extract multiple responses
    this.multiple_responses = conversations_source.getJSONArray ("multipleDialogs");
    // extract dimensional dialogs
    this.dimensional_dialogs = conversations_source.getJSONArray ("dimensionalDialogs");
  }
  void fixedDialog (Human human_a, Human human_b) {
    // seek random element
    JSONObject dialog = this.fixed_dialogs.getJSONObject ((int)random (0, this.fixed_dialogs.size ()));
    // extract starter and response texts
    String starter = dialog.getString ("starter");
    String response = dialog.getString ("response");
    
    human_a.dialog = starter+"\n\n\n\n\n";
    human_b.dialog = response+"\n\n\n\n\n";
  }
  void multipleResponses (Human human_a, Human human_b) {
    // seek random starter element
    JSONObject dialog = this.multiple_responses.getJSONObject ((int)random (0, this.multiple_responses.size ()));
    JSONArray starters = dialog.getJSONArray ("starters");
    // extract random starter dialog
    JSONObject starter_object = starters.getJSONObject ((int)random (0, starters.size ()));
    String starter = starter_object.getString ("starter");
    
    // extract random response dialog
    JSONArray responses = dialog.getJSONArray ("responses");
    JSONObject response_object = responses.getJSONObject ((int)random (0, responses.size ()));
    String response = response_object.getString ("response");
    
    human_a.dialog = starter+"\n\n\n\n\n";
    human_b.dialog = response+"\n\n\n\n\n";
  }
  void dimensionalDialogs (Human human_a, Human human_b) {
    // seek random element
    JSONObject dialog = this.dimensional_dialogs.getJSONObject ((int)random (0, this.dimensional_dialogs.size ()));
    
    // depending on mood, extract good or bad starter
    String starter_label = human_a.mood>=0?"good_starters":"bad_starters";
    JSONArray starters = dialog.getJSONArray (starter_label);
    JSONObject starter_object = starters.getJSONObject ((int)random (0, starters.size ()));
    String starter = starter_object.getString ("starter");
    
    // depending on mood, extract good or bad response
    String response_label = human_b.mood>=0?"good_responses":"bad_responses";
    JSONArray responses = dialog.getJSONArray (response_label);
    JSONObject response_object = responses.getJSONObject ((int)random (0, responses.size ()));
    String response = response_object.getString ("response");
    
    human_a.dialog = starter+"\n\n\n\n\n";
    human_b.dialog = response+"\n\n\n\n\n";
  }
}
