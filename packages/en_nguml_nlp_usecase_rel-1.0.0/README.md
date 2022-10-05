English model for ngUML Use Case Modeling.

| Feature | Description |
| --- | --- |
| **Name** | `en_nguml_nlp_usecase_rel` |
| **Version** | `1.0.0` |
| **spaCy** | `>=3.4.1,<3.5.0` |
| **Default Pipeline** | `transformer`, `relation_extractor` |
| **Components** | `transformer`, `relation_extractor` |
| **Vectors** | 0 keys, 0 unique vectors (0 dimensions) |
| **Sources** | n/a |
| **License** | `Apache 2.0` |
| **Author** | [Anna](https://nguml.com) |

### Label Scheme

<details>

<summary>View label scheme (3 labels for 1 components)</summary>

| Component | Labels |
| --- | --- |
| **`relation_extractor`** | `INTERACT`, `INCLUDE`, `EXTEND` |

</details>

### Accuracy

| Type | Score |
| --- | --- |
| `REL_MICRO_P` | 83.86 |
| `REL_MICRO_R` | 69.40 |
| `REL_MICRO_F` | 75.95 |
| `TRANSFORMER_LOSS` | 7.52 |
| `RELATION_EXTRACTOR_LOSS` | 317.39 |