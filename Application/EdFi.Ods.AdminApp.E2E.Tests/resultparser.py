import json
import xml.etree.cElementTree as ET

def readReport():
  result = []
  with open("./reports/report.json") as json_file:
    jsonContent = json.load(json_file)

    for feature in jsonContent:
      for scenario in feature["elements"]:

        success = True
        for step in scenario["steps"]:
          success = step["result"]["status"] == "passed"
          if success == False:
            break

        current = {"name": feature["name"] +" - " + scenario["name"], "success": success}

        existing = next((item for item in result if (item["name"] == current["name"])), None)
        if existing and existing["success"] is True and current["success"] is False:
          index = result.index(existing)
          result.pop(index)
          existing = None

        if not existing:
          result.append(current)

    return result

def buildXML(items):
  root = ET.Element("testsuite")
  tree = ET.ElementTree(root)

  for item in items:
    tc = ET.SubElement(root, "testcase", {"name": item["name"]})
    if not item["success"]:
      ET.SubElement(tc, "failure")

  tree.write("reports/playwright-results.xml")

result = readReport()
buildXML(result)
