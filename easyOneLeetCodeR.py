class Solution(object):
  def romanToInt(self, s):
  """
        :type s: str
        :rtype: int
        """
result = 0
mappings = {
  'I': 1,
  'V': 5,
  'X': 10,
  'L': 50,
  'C': 100,
  'D': 500,
  'M': 1000
}
for i in range(len(s)):
  if i+1 < len(s) and mappings[s[i]] < mappings[s[i+1]]:
  result -= mappings[s[i]]
else:
  result += mappings[s[i]]
return result
