from webapp2 import RequestHandler
import json, time, logging
import db
from datetime import datetime

def datetime_default(obj):
    if isinstance(obj, datetime):
      return obj.strftime("%d/%m/%y")
    
class DefaultHandler(RequestHandler):
  def get(self, ):
    pageTpl = env.get_template(self.tpl)
    self.response.write(pageTpl.render())

class MainHandler(DefaultHandler):
  tpl = 'index.tpl'

class AddHandler(DefaultHandler):
  tpl = 'add.tpl'

class UpdateHandler(DefaultHandler):
  tpl = 'update.tpl'

class PunchService(RequestHandler):
  def put(self):
    data = json.loads(self.request.body)
    punch = db.Punch.save(data)
    json.dump(punch.to_dict(), self.response, default=datetime_default)



