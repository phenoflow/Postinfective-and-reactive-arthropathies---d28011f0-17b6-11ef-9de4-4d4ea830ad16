cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  postinfective-and-reactive-arthropathies---primary:
    run: postinfective-and-reactive-arthropathies---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  postinfective-and-reactive-arthropathies-reiter---primary:
    run: postinfective-and-reactive-arthropathies-reiter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: postinfective-and-reactive-arthropathies---primary/output
  other-postinfective-and-reactive-arthropathies---primary:
    run: other-postinfective-and-reactive-arthropathies---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: postinfective-and-reactive-arthropathies-reiter---primary/output
  postinfective-and-reactive-arthropathies-ankle---primary:
    run: postinfective-and-reactive-arthropathies-ankle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: other-postinfective-and-reactive-arthropathies---primary/output
  postinfective-and-reactive-arthropathies-finger---primary:
    run: postinfective-and-reactive-arthropathies-finger---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: postinfective-and-reactive-arthropathies-ankle---primary/output
  postinfective-and-reactive-arthropathies-joint---primary:
    run: postinfective-and-reactive-arthropathies-joint---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: postinfective-and-reactive-arthropathies-finger---primary/output
  arthropathies---primary:
    run: arthropathies---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: postinfective-and-reactive-arthropathies-joint---primary/output
  postinfective-and-reactive-arthropathies-acquired---primary:
    run: postinfective-and-reactive-arthropathies-acquired---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: arthropathies---primary/output
  multiple-postinfective-and-reactive-arthropathies---primary:
    run: multiple-postinfective-and-reactive-arthropathies---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: postinfective-and-reactive-arthropathies-acquired---primary/output
  postdysenteric-postinfective-and-reactive-arthropathies---primary:
    run: postdysenteric-postinfective-and-reactive-arthropathies---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: multiple-postinfective-and-reactive-arthropathies---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: postdysenteric-postinfective-and-reactive-arthropathies---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
