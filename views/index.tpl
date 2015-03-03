{% extends "base.tpl" %}
{% block title %}Index{% endblock %}
{% block head %}
  {{ super() }}
  <style>
    .row{
      padding: 10px;
    }
  </style>

{% endblock %}
{% block container %}
  {% if main %}
  <h2 class="pull-left">Main Menu</h2>
  <div class="clearfix"></div>
  <div class="col-sm-6 col-sm-offset-3 row">
    <a href="/punches" role="button" class="btn btn-primary pull-left"><img src="/static/img/floppy.png"> Punches database </a>
  </div>
  <div class="clearfix"></div>
  <div class="col-sm-6 col-sm-offset-3 row">
    <a href="#" role="button" class="btn btn-primary pull-left"><img src="/static/img/folder-task.png" href="#"> Completion logs </a>
  </div>
  <div class="clearfix"></div>
  <div class="col-sm-6 col-sm-offset-3 row">
    <a href="#" role="button" class="btn btn-primary pull-left"><img src="/static/img/folder-doc.png" href="#"> Audits </a>
  </div>
  <div class="clearfix"></div>
  {% else %}
  <h2 class="pull-left">Punches Database</h2>
  <div class="clearfix"></div>
  <div class="col-sm-6 col-sm-offset-6 row">
    <a href="/add" role="button" class="btn btn-primary pull-left"><img src="/static/img/document.png"> Add punch </a>
  </div>
  <div class="clearfix"></div>
  <div class="row">
    <div class="col-sm-6">
      <a href="/" role="button" class="btn btn-danger pull-right"><img src="/static/img/back.png" href="#"> Main menu </a>
    </div>
    <div class="col-sm-6">
      <a href="/update" role="button" class="btn btn-primary pull-left"><img src="/static/img/switch.png" href="#"> Change Status </a>
    </div>
  </div>
  <div class="clearfix"></div>
  <div class="col-sm-6 col-sm-offset-6 row">
    <a href="/reports" role="button" class="btn btn-primary pull-left"><img src="/static/img/printer.png" href="#"> Reports </a>
  </div>
  <div class="clearfix"></div>
  {% endif %}

{% endblock %}