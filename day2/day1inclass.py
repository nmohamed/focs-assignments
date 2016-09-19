'''
	9/1
	NOTES:

'''

itemsorig = [1, '+', 2, '*', 2]
itemsrpn = [1, 2, '+', 2, '*']

def asyougo(items):
	for i in xrange(0,len(items)-1, 2):
	 	if(items[i+1] == '+'):
	 		result = items[i] + items[i+2]
	 	elif(items[i+1 == '*']):
	 		result = items[i] * items[i+2]
	 	items[i+2] = result
	 	print '\n\n\n***\ni=', i, '\nres=', result, '\nnew item is:', items[i+2]
	 	if(i+2 == len(items)):
	 		print 'final answer:', result
	 		break

def rpn(items):
	for i in xrange(0,len(items)-1, 2):
	 	if(items[i+2] == '+'):
	 		result = items[i] + items[i+1]
	 	elif(items[i+2 == '*']):
	 		result = items[i] * items[i+1]
	 	else:
	 		pass
	 		# if for some reason you want to do 1 2 3 + +
	 		# i += 1
	 	items[i+2] = result
	 	print '\n***\ni=', i, '\nres=', result, '\nnew item is:', items[i+2]
	 	if(i+2 == len(items)):
	 		print 'final answer:', result
	 		break

def betterrpm(items):
	#find first operand
	for i in xrange(0,len(items)-1):
		if type(items[i]) == String:
			if(items[i] == '+'):
				items[i-2] = items[i-2] + items[i-1]
			pop(items[i])
			pop(items[i-1])


# asyougo(itemsorig)
rpn(itemsrpn)