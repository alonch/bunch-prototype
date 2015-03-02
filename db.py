from google.appengine.ext import ndb

class Punch(ndb.Model):
  id = ndb.IntegerProperty()
  system = ndb.IntegerProperty()
  tag = ndb.IntegerProperty()
  category = ndb.StringProperty()
  status = ndb.BooleanProperty()
  description = ndb.StringProperty()
  attendance = ndb.StringProperty()
  responsible = ndb.StringProperty()
  created = ndb.DateTimeProperty(auto_now_add=True)
  modified = ndb.DateTimeProperty(auto_now=True)

  @staticmethod
  def getNextId():
    return Punch.query().count() + 1

  @staticmethod
  def save(data):
    self = Punch()
    self.populate(**data)
    self.id = Punch.getNextId()
    self.put()
    return self

  @staticmethod
  def getSystems():
    punches = Punch.query(projection=["system"], distinct=True)
    if punches is None:
      return []
    return [punch.system for punch in punches if punch.system is not None]

  @staticmethod
  def getTags():
    punches = Punch.query(projection=["tag"], distinct=True)
    if punches is None:
      return []
    return [punch.tag for punch in punches if punch.tag is not None]
