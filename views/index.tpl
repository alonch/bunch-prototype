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
    <div class="row">
      <div class="col-sm-6">
        <a href="/add" role="button" class="btn btn-primary"><img src="/static/img/document.png"> Add punch </a>
      </div>
      <div class="col-sm-6">
        <a href="/update" role="button" class="btn btn-primary"><img src="/static/img/switch.png" href="#"> Change Status </a>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-6">
        <a href="/reports" role="button" class="btn btn-primary"><img src="/static/img/printer.png" href="#"> Reports </a>
      </div>
      <div class="col-sm-6">
        <a href="/logs" role="button" class="btn btn-primary"><img src="/static/img/run.png" href="#"> Change Log </a>
      </div>
    </div>
    <div class="clearfix visible-sm"></div>
{% endblock %}