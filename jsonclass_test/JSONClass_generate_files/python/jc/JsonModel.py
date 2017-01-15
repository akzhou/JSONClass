class Name(object):
	def __init__(self):
		"""
		: attribute firstName : string
		: attribute lastName : string
		"""
		self.firstName = None
		self.lastName = None


class SignInReq(object):
	def __init__(self):
		"""
		: attribute username : string
		: attribute password : string
		"""
		self.username = None
		self.password = None


class SignInRsp(object):
	def __init__(self):
		"""
		: attribute code : int
		: attribute msg : string
		: attribute classRoom : ClassRoom
		"""
		self.code = None
		self.msg = None
		self.classRoom = None


class ClassRoom(object):
	def __init__(self):
		"""
		: attribute students : array
		"""
		self.students = None


class Student(object):
	def __init__(self):
		"""
		: attribute gender : bool
		: attribute number : int
		: attribute age : int
		: attribute grade : int
		: attribute level : int
		: attribute height : float
		: attribute weight : float
		: attribute name : Name
		: attribute testBools : array
		: attribute testInts : array
		: attribute testFloats : array
		: attribute testStrings : array
		"""
		self.gender = None
		self.number = None
		self.age = None
		self.grade = None
		self.level = None
		self.height = None
		self.weight = None
		self.name = None
		self.testBools = None
		self.testInts = None
		self.testFloats = None
		self.testStrings = None


