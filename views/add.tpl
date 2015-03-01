{% extends "base.tpl" %}
{% block title %}Add Punch{% endblock %}
{% block addPage %}active{% endblock %}
{% block container %}
<form class="form-horizontal">
  <div class="form-group">
    <label for="system" class="col-lg-2 control-label">System</label>
    <div class="col-lg-4">
      <input type="text" class="form-control" name="system" id="system" placeholder="ID of the System">
    </div>
    <label for="tag" class="col-lg-2 control-label">Tag</label>
    <div class="col-lg-4">
      <input type="text" class="form-control" name="tag" id="tag" placeholder="ID of the Tag">
    </div>
  </div>
  <div class="form-group">
    <label for="system" class="col-lg-2 control-label">Category</label>
    <div class="col-lg-4">
      <select class="form-control">
        <option>A</option>
        <option>BSU</option>
        <option>BCC</option>
        <option>BCSU</option>
        <option>CBCC</option>
      </select>
    </div>
    <label for="tag" class="col-lg-2 control-label">Status</label>
    <div class="col-lg-4">
      <select class="form-control">
        <option>Open</option>
        <option>Closed</option>
      </select>
    </div>
  </div>  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Description</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="Description...">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Attendance FE CSU</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="Attendance FE CSU">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Responsible to Fix</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="Responsible to Fix">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
</form>
{% endblock %}