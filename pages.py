from webapp2 import RequestHandler
import json, time, logging
import db
from datetime import datetime

def datetime_default(obj):
    if isinstance(obj, datetime):
      return obj.strftime("%d/%m/%y")
    

class MainHandler(RequestHandler):
  def get(self):
    tpl = env.get_template('index.tpl')
    self.response.write(tpl.render())

class AddHandler(RequestHandler):
  def get(self):
    tpl = env.get_template('add.tpl')
    self.response.write(tpl.render())

class PunchService(RequestHandler):
  def put(self):
    data = json.loads(self.request.body)
    punch = db.Punch.save(data)
    json.dump(punch.to_dict(), self.response, default=datetime_default)



