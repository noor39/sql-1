
SQL*Plus: Release 19.0.0.0.0 - Production on Mon Mar 10 09:34:17 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> alter session set container=orclpdb;

Session altered.

SQL> alter pluggable database open;
alter pluggable database open
*
ERROR at line 1:
ORA-65019: pluggable database ORCLPDB already open


SQL> conn hr/hr@orclpdb;
Connected.
SQL> SELECT last_name, job_id,department_id, hire_date
  2  FROM employees
  3  ORDER BY hire_date;

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
De Haan                   AD_VP                 90 13-JAN-01
Mavris                    HR_REP                40 07-JUN-02
Higgins                   AC_MGR               110 07-JUN-02
Baer                      PR_REP                70 07-JUN-02
Gietz                     AC_ACCOUNT           110 07-JUN-02
Faviet                    FI_ACCOUNT           100 16-AUG-02
Greenberg                 FI_MGR               100 17-AUG-02
Raphaely                  PU_MAN                30 07-DEC-02
Kaufling                  ST_MAN                50 01-MAY-03
Khoo                      PU_CLERK              30 18-MAY-03
King                      AD_PRES               90 17-JUN-03

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Ladwig                    ST_CLERK              50 14-JUL-03
Whalen                    AD_ASST               10 17-SEP-03
Rajs                      ST_CLERK              50 17-OCT-03
Sarchand                  SH_CLERK              50 27-JAN-04
King                      SA_REP                80 30-JAN-04
Bell                      SH_CLERK              50 04-FEB-04
Hartstein                 MK_MAN                20 17-FEB-04
Sully                     SA_REP                80 04-MAR-04
Abel                      SA_REP                80 11-MAY-04
Mallin                    ST_CLERK              50 14-JUN-04
Weiss                     ST_MAN                50 18-JUL-04

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
McEwen                    SA_REP                80 01-AUG-04
Russell                   SA_MAN                80 01-OCT-04
Partners                  SA_MAN                80 05-JAN-05
Davies                    ST_CLERK              50 29-JAN-05
Tucker                    SA_REP                80 30-JAN-05
Marlow                    ST_CLERK              50 16-FEB-05
Bull                      SH_CLERK              50 20-FEB-05
Everett                   SH_CLERK              50 03-MAR-05
Errazuriz                 SA_MAN                80 10-MAR-05
Smith                     SA_REP                80 10-MAR-05
Ozer                      SA_REP                80 11-MAR-05

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Hutton                    SA_REP                80 19-MAR-05
Bernstein                 SA_REP                80 24-MAR-05
Fripp                     ST_MAN                50 10-APR-05
Chung                     SH_CLERK              50 14-JUN-05
Austin                    IT_PROG               60 25-JUN-05
Nayer                     ST_CLERK              50 16-JUL-05
Tobias                    PU_CLERK              30 24-JUL-05
Dilly                     SH_CLERK              50 13-AUG-05
Fay                       MK_REP                20 17-AUG-05
Hall                      SA_REP                80 20-AUG-05
Bissot                    ST_CLERK              50 20-AUG-05

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Kochhar                   AD_VP                 90 21-SEP-05
Chen                      FI_ACCOUNT           100 28-SEP-05
Sciarra                   FI_ACCOUNT           100 30-SEP-05
Vollman                   ST_MAN                50 10-OCT-05
Stiles                    ST_CLERK              50 26-OCT-05
Atkinson                  ST_CLERK              50 30-OCT-05
Vishney                   SA_REP                80 11-NOV-05
Doran                     SA_REP                80 15-DEC-05
Baida                     PU_CLERK              30 24-DEC-05
Hunold                    IT_PROG               60 03-JAN-06
Fox                       SA_REP                80 24-JAN-06

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Taylor                    SH_CLERK              50 24-JAN-06
Pataballa                 IT_PROG               60 05-FEB-06
Seo                       ST_CLERK              50 12-FEB-06
Fleaur                    SH_CLERK              50 23-FEB-06
Urman                     FI_ACCOUNT           100 07-MAR-06
Matos                     ST_CLERK              50 15-MAR-06
Bloom                     SA_REP                80 23-MAR-06
Taylor                    SA_REP                80 24-MAR-06
Olsen                     SA_REP                80 30-MAR-06
Patel                     ST_CLERK              50 06-APR-06
Livingston                SA_REP                80 23-APR-06

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Walsh                     SH_CLERK              50 24-APR-06
Feeney                    SH_CLERK              50 23-MAY-06
Dellinger                 SH_CLERK              50 24-JUN-06
McCain                    SH_CLERK              50 01-JUL-06
Vargas                    ST_CLERK              50 09-JUL-06
Gates                     SH_CLERK              50 11-JUL-06
Rogers                    ST_CLERK              50 26-AUG-06
Mikkilineni               ST_CLERK              50 28-SEP-06
Sewall                    SA_REP                80 03-NOV-06
Himuro                    PU_CLERK              30 15-NOV-06
Cambrault                 SA_REP                80 09-DEC-06

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Landry                    ST_CLERK              50 14-JAN-07
Cabrio                    SH_CLERK              50 07-FEB-07
Lorentz                   IT_PROG               60 07-FEB-07
Smith                     SA_REP                80 23-FEB-07
Jones                     SH_CLERK              50 17-MAR-07
Greene                    SA_REP                80 19-MAR-07
Bates                     SA_REP                80 24-MAR-07
Olson                     ST_CLERK              50 10-APR-07
Ernst                     IT_PROG               60 21-MAY-07
Grant                     SA_REP                   24-MAY-07
Sullivan                  SH_CLERK              50 21-JUN-07

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
OConnell                  SH_CLERK              50 21-JUN-07
Colmenares                PU_CLERK              30 10-AUG-07
Cambrault                 SA_MAN                80 15-OCT-07
Mourgos                   ST_MAN                50 16-NOV-07
Tuvault                   SA_REP                80 23-NOV-07
Popp                      FI_ACCOUNT           100 07-DEC-07
Gee                       ST_CLERK              50 12-DEC-07
Perkins                   SH_CLERK              50 19-DEC-07
Johnson                   SA_REP                80 04-JAN-08
Grant                     SH_CLERK              50 13-JAN-08
Marvins                   SA_REP                80 24-JAN-08

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Zlotkey                   SA_MAN                80 29-JAN-08
Geoni                     SH_CLERK              50 03-FEB-08
Philtanker                ST_CLERK              50 06-FEB-08
Lee                       SA_REP                80 23-FEB-08
Markle                    ST_CLERK              50 08-MAR-08
Ande                      SA_REP                80 24-MAR-08
Kumar                     SA_REP                80 21-APR-08
Banda                     SA_REP                80 21-APR-08
NOOR AHMED                IT_PROG               60 02-MAR-25
NOOR                      IT_PROG               60 04-MAR-25
Noor Ahmed                IT_PROG               60 04-MAR-25

110 rows selected.

SQL> SELECT select_list
  2  FROM table
  3  WHERE expr operator
  4                     (SELECT select_list
  5                     FROM table);
WHERE expr operator
*
ERROR at line 3:
ORA-00906: missing left parenthesis


SQL> SELECT last_name, salary, job_id
  2  FROm employees
  3  WHERE salary=(SELECT MIN(salary)
  4             FROM employees);

LAST_NAME                     SALARY JOB_ID
------------------------- ---------- ----------
Olson                           2100 ST_CLERK

SQL> describe dictionary
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TABLE_NAME                                         VARCHAR2(128)
 COMMENTS                                           VARCHAR2(4000)

SQL> select * from dictionary
  2  /

TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL$OLAP2_AWS


ALL_ALL_TABLES


ALL_ANALYTIC_VIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ANALYTIC_VIEW_ATTR_CLASS


ALL_ANALYTIC_VIEW_BASE_MEAS


ALL_ANALYTIC_VIEW_CALC_MEAS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ANALYTIC_VIEW_CLASS


ALL_ANALYTIC_VIEW_COLUMNS


ALL_ANALYTIC_VIEW_DIMENSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ANALYTIC_VIEW_DIM_CLASS


ALL_ANALYTIC_VIEW_HIERS


ALL_ANALYTIC_VIEW_HIER_CLASS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ANALYTIC_VIEW_KEYS


ALL_ANALYTIC_VIEW_LEVELS


ALL_ANALYTIC_VIEW_LEVEL_CLASS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ANALYTIC_VIEW_LVLGRPS


ALL_ANALYTIC_VIEW_MEAS_CLASS


ALL_APPLY



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_APPLY_CHANGE_HANDLERS


ALL_APPLY_CONFLICT_COLUMNS


ALL_APPLY_DML_CONF_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_APPLY_DML_CONF_HANDLERS


ALL_APPLY_DML_HANDLERS


ALL_APPLY_ENQUEUE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_APPLY_ERROR


ALL_APPLY_ERROR_MESSAGES


ALL_APPLY_EXECUTE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_APPLY_HANDLE_COLLISIONS


ALL_APPLY_INSTANTIATED_GLOBAL


ALL_APPLY_INSTANTIATED_OBJECTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_APPLY_INSTANTIATED_SCHEMAS


ALL_APPLY_KEY_COLUMNS


ALL_APPLY_PARAMETERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_APPLY_PROGRESS


ALL_APPLY_REPERROR_HANDLERS


ALL_APPLY_SPILL_TXN



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_APPLY_TABLE_COLUMNS


ALL_ARGUMENTS


ALL_ASSEMBLIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ASSOCIATIONS


ALL_ATTRIBUTE_DIMENSIONS


ALL_ATTRIBUTE_DIM_ATTRS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ATTRIBUTE_DIM_ATTR_CLASS


ALL_ATTRIBUTE_DIM_CLASS


ALL_ATTRIBUTE_DIM_JOIN_PATHS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ATTRIBUTE_DIM_KEYS


ALL_ATTRIBUTE_DIM_LEVELS


ALL_ATTRIBUTE_DIM_LEVEL_ATTRS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ATTRIBUTE_DIM_LVL_CLASS


ALL_ATTRIBUTE_DIM_ORDER_ATTRS


ALL_ATTRIBUTE_DIM_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ATTRIBUTE_TRANSFORMATIONS


ALL_AUDITED_SYSTEM_ACTIONS


ALL_AUDIT_POLICIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_AUDIT_POLICY_COLUMNS


ALL_AWS


ALL_AW_AC



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_AW_AC_10G


ALL_AW_OBJ


ALL_AW_PROP



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_AW_PROP_NAME


ALL_AW_PS


ALL_BASE_TABLE_MVIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CAPTURE


ALL_CAPTURE_EXTRA_ATTRIBUTES


ALL_CAPTURE_PARAMETERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CAPTURE_PREPARED_DATABASE


ALL_CAPTURE_PREPARED_SCHEMAS


ALL_CAPTURE_PREPARED_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CATALOG


ALL_CLUSTERING_DIMENSIONS


ALL_CLUSTERING_JOINS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CLUSTERING_KEYS


ALL_CLUSTERING_TABLES


ALL_CLUSTERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CLUSTER_HASH_EXPRESSIONS


ALL_CODE_ROLE_PRIVS


ALL_COLL_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_COL_COMMENTS


ALL_COL_PENDING_STATS


ALL_COL_PRIVS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_COL_PRIVS_MADE


ALL_COL_PRIVS_RECD


ALL_COMPARISON_SCAN_SUMMARY



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CONSTRAINTS


ALL_CONS_COLUMNS


ALL_CONS_OBJ_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CONTEXT


ALL_CREDENTIALS


ALL_CUBES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_ATTRIBUTES


ALL_CUBE_ATTR_MAPPINGS


ALL_CUBE_ATTR_UNIQUE_KEYS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_ATTR_VISIBILITY


ALL_CUBE_BUILD_PROCESSES


ALL_CUBE_CALCULATED_MEMBERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_CLASSIFICATIONS


ALL_CUBE_DEPENDENCIES


ALL_CUBE_DESCRIPTIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_DIMENSIONALITY


ALL_CUBE_DIMENSIONS


ALL_CUBE_DIMNL_MAPPINGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_DIM_LEVELS


ALL_CUBE_DIM_MAPPINGS


ALL_CUBE_DIM_MODELS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_DIM_VIEWS


ALL_CUBE_DIM_VIEW_COLUMNS


ALL_CUBE_HIERARCHIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_HIER_LEVELS


ALL_CUBE_HIER_VIEWS


ALL_CUBE_HIER_VIEW_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_MAPPINGS


ALL_CUBE_MEASURES


ALL_CUBE_MEAS_MAPPINGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_NAMED_BUILD_SPECS


ALL_CUBE_SUB_PARTITION_LEVELS


ALL_CUBE_VIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_CUBE_VIEW_COLUMNS


ALL_DB_LINKS


ALL_DEF_AUDIT_OPTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_DEPENDENCIES


ALL_DEQUEUE_QUEUES


ALL_DIMENSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_DIM_ATTRIBUTES


ALL_DIM_CHILD_OF


ALL_DIM_HIERARCHIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_DIM_JOIN_KEY


ALL_DIM_LEVELS


ALL_DIM_LEVEL_KEY



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_DIRECTORIES


ALL_EDITIONING_VIEWS


ALL_EDITIONING_VIEWS_AE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_EDITIONING_VIEW_COLS


ALL_EDITIONING_VIEW_COLS_AE


ALL_EDITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_EDITION_COMMENTS


ALL_ENCRYPTED_COLUMNS


ALL_ERRORS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ERRORS_AE


ALL_ERROR_TRANSLATIONS


ALL_EVALUATION_CONTEXTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_EVALUATION_CONTEXT_TABLES


ALL_EVALUATION_CONTEXT_VARS


ALL_EXPRESSION_STATISTICS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_EXTERNAL_LOCATIONS


ALL_EXTERNAL_TABLES


ALL_FILE_GROUPS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_FILE_GROUP_EXPORT_INFO


ALL_FILE_GROUP_FILES


ALL_FILE_GROUP_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_FILE_GROUP_TABLESPACES


ALL_FILE_GROUP_VERSIONS


ALL_GG_AUTO_CDR_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_GG_AUTO_CDR_COLUMN_GROUPS


ALL_GG_AUTO_CDR_TABLES


ALL_GG_INBOUND_PROGRESS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_GOLDENGATE_CONTAINER_RULES


ALL_GOLDENGATE_INBOUND


ALL_GOLDENGATE_PRIVILEGES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_GOLDENGATE_RULES


ALL_HEAT_MAP_SEGMENT


ALL_HEAT_MAP_SEG_HISTOGRAM



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_HIERARCHIES


ALL_HIER_CLASS


ALL_HIER_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_HIER_HIER_ATTRIBUTES


ALL_HIER_HIER_ATTR_CLASS


ALL_HIER_JOIN_PATHS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_HIER_LEVELS


ALL_HIER_LEVEL_ID_ATTRS


ALL_IDENTIFIERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_INDEXES


ALL_INDEXTYPES


ALL_INDEXTYPE_ARRAYTYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_INDEXTYPE_COMMENTS


ALL_INDEXTYPE_OPERATORS


ALL_IND_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_IND_COLUMNS_V$


ALL_IND_EXPRESSIONS


ALL_IND_PARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_IND_PENDING_STATS


ALL_IND_STATISTICS


ALL_IND_SUBPARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_INTERNAL_TRIGGERS


ALL_INT_DEQUEUE_QUEUES


ALL_JAVA_ARGUMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_JAVA_CLASSES


ALL_JAVA_COMPILER_OPTIONS


ALL_JAVA_DERIVATIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_JAVA_FIELDS


ALL_JAVA_IMPLEMENTS


ALL_JAVA_INNERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_JAVA_LAYOUTS


ALL_JAVA_METHODS


ALL_JAVA_NCOMPS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_JAVA_RESOLVERS


ALL_JAVA_THROWS


ALL_JOIN_IND_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_JSON_COLUMNS


ALL_JSON_DATAGUIDES


ALL_JSON_DATAGUIDE_FIELDS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_LIBRARIES


ALL_LOBS


ALL_LOB_PARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_LOB_SUBPARTITIONS


ALL_LOB_TEMPLATES


ALL_LOG_GROUPS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_LOG_GROUP_COLUMNS


ALL_MEASURE_FOLDERS


ALL_MEASURE_FOLDER_CONTENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_MEASURE_FOLDER_SUBFOLDERS


ALL_METADATA_PROPERTIES


ALL_METHOD_PARAMS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_METHOD_RESULTS


ALL_MINING_ALGORITHMS


ALL_MINING_MODELS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_MINING_MODEL_ATTRIBUTES


ALL_MINING_MODEL_PARTITIONS


ALL_MINING_MODEL_SETTINGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_MINING_MODEL_VIEWS


ALL_MINING_MODEL_XFORMS


ALL_MVIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_MVIEW_AGGREGATES


ALL_MVIEW_ANALYSIS


ALL_MVIEW_COMMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_MVIEW_DETAIL_PARTITION


ALL_MVIEW_DETAIL_RELATIONS


ALL_MVIEW_DETAIL_SUBPARTITION



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_MVIEW_JOINS


ALL_MVIEW_KEYS


ALL_MVIEW_LOGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_MVIEW_REFRESH_TIMES


ALL_NESTED_TABLES


ALL_NESTED_TABLE_COLS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_OBJECTS


ALL_OBJECTS_AE


ALL_OBJECT_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_OBJ_COLATTRS


ALL_OPANCILLARY


ALL_OPARGUMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_OPBINDINGS


ALL_OPERATORS


ALL_OPERATOR_COMMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_PARTIAL_DROP_TABS


ALL_PART_COL_STATISTICS


ALL_PART_HISTOGRAMS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_PART_INDEXES


ALL_PART_KEY_COLUMNS


ALL_PART_KEY_COLUMNS_V$



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_PART_LOBS


ALL_PART_TABLES


ALL_PENDING_CONV_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_PLSQL_COLL_TYPES


ALL_PLSQL_OBJECT_SETTINGS


ALL_PLSQL_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_PLSQL_TYPE_ATTRS


ALL_POLICIES


ALL_POLICY_ATTRIBUTES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_POLICY_CONTEXTS


ALL_POLICY_GROUPS


ALL_PROBE_OBJECTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_PROCEDURES


ALL_PROPAGATION


ALL_QUEUES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_QUEUE_PUBLISHERS


ALL_QUEUE_SCHEDULES


ALL_QUEUE_SUBSCRIBERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_QUEUE_TABLES


ALL_REFRESH


ALL_REFRESH_CHILDREN



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_REFRESH_DEPENDENCIES


ALL_REFS


ALL_REGISTERED_MVIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_REGISTERED_SNAPSHOTS


ALL_REGISTRY_BANNERS


ALL_REPLICATION_PROCESS_EVENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_REPL_DBNAME_MAPPING


ALL_REWRITE_EQUIVALENCES


ALL_RULES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_RULESETS


ALL_RULE_SETS


ALL_RULE_SET_RULES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_CHAINS


ALL_SCHEDULER_CHAIN_RULES


ALL_SCHEDULER_CHAIN_STEPS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_CREDENTIALS


ALL_SCHEDULER_DB_DESTS


ALL_SCHEDULER_DESTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_EXTERNAL_DESTS


ALL_SCHEDULER_FILE_WATCHERS


ALL_SCHEDULER_GLOBAL_ATTRIBUTE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_GROUPS


ALL_SCHEDULER_GROUP_MEMBERS


ALL_SCHEDULER_INCOMPATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_INCOMPAT_MEMBER


ALL_SCHEDULER_JOBS


ALL_SCHEDULER_JOB_ARGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_JOB_CLASSES


ALL_SCHEDULER_JOB_DESTS


ALL_SCHEDULER_JOB_LOG



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_JOB_RUN_DETAILS


ALL_SCHEDULER_NOTIFICATIONS


ALL_SCHEDULER_PROGRAMS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_PROGRAM_ARGS


ALL_SCHEDULER_REMOTE_DATABASES


ALL_SCHEDULER_REMOTE_JOBSTATE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_RESOURCES


ALL_SCHEDULER_RSC_CONSTRAINTS


ALL_SCHEDULER_RUNNING_CHAINS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_RUNNING_JOBS


ALL_SCHEDULER_SCHEDULES


ALL_SCHEDULER_WINDOWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_WINDOW_DETAILS


ALL_SCHEDULER_WINDOW_GROUPS


ALL_SCHEDULER_WINDOW_LOG



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SCHEDULER_WINGROUP_MEMBERS


ALL_SECONDARY_OBJECTS


ALL_SEC_RELEVANT_COLS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SEQUENCES


ALL_SERVICES


ALL_SNAPSHOTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SNAPSHOT_LOGS


ALL_SOURCE


ALL_SOURCE_AE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SQLJ_TYPES


ALL_SQLJ_TYPE_ATTRS


ALL_SQLJ_TYPE_METHODS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SQLSET


ALL_SQLSET_BINDS


ALL_SQLSET_PLANS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SQLSET_REFERENCES


ALL_SQLSET_STATEMENTS


ALL_SQL_TRANSLATIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SQL_TRANSLATION_PROFILES


ALL_STATEMENTS


ALL_STAT_EXTENSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_STORED_SETTINGS


ALL_STREAMS_COLUMNS


ALL_STREAMS_GLOBAL_RULES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_STREAMS_KEEP_COLUMNS


ALL_STREAMS_MESSAGE_CONSUMERS


ALL_STREAMS_MESSAGE_RULES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_STREAMS_NEWLY_SUPPORTED


ALL_STREAMS_RULES


ALL_STREAMS_SCHEMA_RULES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_STREAMS_TABLE_RULES


ALL_STREAMS_TRANSFORMATIONS


ALL_STREAMS_TRANSFORM_FUNCTION



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_STREAMS_UNSUPPORTED


ALL_SUBPARTITION_TEMPLATES


ALL_SUBPART_COL_STATISTICS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SUBPART_HISTOGRAMS


ALL_SUBPART_KEY_COLUMNS


ALL_SUBPART_KEY_COLUMNS_V$



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SUMDELTA


ALL_SUMMAP


ALL_SUMMARIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SUMMARY_AGGREGATES


ALL_SUMMARY_DETAIL_TABLES


ALL_SUMMARY_JOINS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SUMMARY_KEYS


ALL_SYNC_CAPTURE


ALL_SYNC_CAPTURE_PREPARED_TABS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_SYNC_CAPTURE_TABLES


ALL_SYNONYMS


ALL_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TAB_COLS


ALL_TAB_COLS_V$


ALL_TAB_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TAB_COL_STATISTICS


ALL_TAB_COMMENTS


ALL_TAB_HISTGRM_PENDING_STATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TAB_HISTOGRAMS


ALL_TAB_IDENTITY_COLS


ALL_TAB_MODIFICATIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TAB_PARTITIONS


ALL_TAB_PENDING_STATS


ALL_TAB_PRIVS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TAB_PRIVS_MADE


ALL_TAB_PRIVS_RECD


ALL_TAB_STATISTICS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TAB_STATS_HISTORY


ALL_TAB_STAT_PREFS


ALL_TAB_SUBPARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TRANSFORMATIONS


ALL_TRIGGERS


ALL_TRIGGERS_AE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TRIGGER_COLS


ALL_TRIGGER_ORDERING


ALL_TSTZ_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TSTZ_TAB_COLS


ALL_TYPES


ALL_TYPE_ATTRS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_TYPE_METHODS


ALL_TYPE_VERSIONS


ALL_UNUSED_COL_TABS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_UPDATABLE_COLUMNS


ALL_USERS


ALL_USTATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_VARRAYS


ALL_VIEWS


ALL_VIEWS_AE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_WARNING_SETTINGS


ALL_XDS_ACL_REFRESH


ALL_XDS_ACL_REFSTAT



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XDS_LATEST_ACL_REFSTAT


ALL_XMLTYPE_COLS


ALL_XML_INDEXES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XML_NESTED_TABLES


ALL_XML_OUT_OF_LINE_TABLES


ALL_XML_SCHEMAS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XML_SCHEMAS2


ALL_XML_SCHEMA_ATTRIBUTES


ALL_XML_SCHEMA_COMPLEX_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XML_SCHEMA_ELEMENTS


ALL_XML_SCHEMA_NAMESPACES


ALL_XML_SCHEMA_SIMPLE_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XML_SCHEMA_SUBSTGRP_HEAD


ALL_XML_SCHEMA_SUBSTGRP_MBRS


ALL_XML_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XML_TAB_COLS


ALL_XML_VIEWS


ALL_XML_VIEW_COLS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XSTREAM_ADMINISTRATOR


ALL_XSTREAM_INBOUND


ALL_XSTREAM_INBOUND_PROGRESS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XSTREAM_OUTBOUND


ALL_XSTREAM_OUTBOUND_PROGRESS


ALL_XSTREAM_OUT_SUPPORT_MODE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XSTREAM_RULES


ALL_XSTREAM_TRANSFORMATIONS


ALL_XS_ACES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XS_ACLS


ALL_XS_ACL_PARAMETERS


ALL_XS_APPLICABLE_OBJECTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XS_APPLIED_POLICIES


ALL_XS_COLUMN_CONSTRAINTS


ALL_XS_IMPLIED_PRIVILEGES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XS_INHERITED_REALMS


ALL_XS_POLICIES


ALL_XS_PRIVILEGES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XS_REALM_CONSTRAINTS


ALL_XS_SECURITY_CLASSES


ALL_XS_SECURITY_CLASS_DEP



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XTERNAL_LOC_PARTITIONS


ALL_XTERNAL_LOC_SUBPARTITIONS


ALL_XTERNAL_PART_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_XTERNAL_TAB_PARTITIONS


ALL_XTERNAL_TAB_SUBPARTITIONS


ALL_ZONEMAPS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
ALL_ZONEMAP_MEASURES


USER_ADDM_FDG_BREAKDOWN


USER_ADDM_FINDINGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADDM_INSTANCES


USER_ADDM_TASKS


USER_ADDM_TASK_DIRECTIVES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_ACTIONS


USER_ADVISOR_DIR_TASK_INST


USER_ADVISOR_EXECUTIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_EXEC_PARAMETERS


USER_ADVISOR_FDG_BREAKDOWN


USER_ADVISOR_FINDINGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_JOURNAL


USER_ADVISOR_LOG


USER_ADVISOR_OBJECTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_PARAMETERS


USER_ADVISOR_RATIONALE


USER_ADVISOR_RECOMMENDATIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_SQLA_COLVOL


USER_ADVISOR_SQLA_REC_SUM


USER_ADVISOR_SQLA_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_SQLA_TABVOL


USER_ADVISOR_SQLA_WK_MAP


USER_ADVISOR_SQLA_WK_STMTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_SQLA_WK_SUM


USER_ADVISOR_SQLPLANS


USER_ADVISOR_SQLSTATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_SQLW_COLVOL


USER_ADVISOR_SQLW_JOURNAL


USER_ADVISOR_SQLW_PARAMETERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_SQLW_STMTS


USER_ADVISOR_SQLW_SUM


USER_ADVISOR_SQLW_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_SQLW_TABVOL


USER_ADVISOR_SQLW_TEMPLATES


USER_ADVISOR_TASKS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ADVISOR_TEMPLATES


USER_ALL_TABLES


USER_ANALYTIC_VIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ANALYTIC_VIEW_ATTR_CLASS


USER_ANALYTIC_VIEW_BASE_MEAS


USER_ANALYTIC_VIEW_CALC_MEAS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ANALYTIC_VIEW_CLASS


USER_ANALYTIC_VIEW_COLUMNS


USER_ANALYTIC_VIEW_DIMENSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ANALYTIC_VIEW_DIM_CLASS


USER_ANALYTIC_VIEW_HIERS


USER_ANALYTIC_VIEW_HIER_CLASS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ANALYTIC_VIEW_KEYS


USER_ANALYTIC_VIEW_LEVELS


USER_ANALYTIC_VIEW_LEVEL_CLASS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ANALYTIC_VIEW_LVLGRPS


USER_ANALYTIC_VIEW_MEAS_CLASS


USER_APPLICATION_ROLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_APPLY_ERROR


USER_AQ_AGENT_PRIVS


USER_ARGUMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ASSEMBLIES


USER_ASSOCIATIONS


USER_ATTRIBUTE_DIMENSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ATTRIBUTE_DIM_ATTRS


USER_ATTRIBUTE_DIM_ATTR_CLASS


USER_ATTRIBUTE_DIM_CLASS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ATTRIBUTE_DIM_JOIN_PATHS


USER_ATTRIBUTE_DIM_KEYS


USER_ATTRIBUTE_DIM_LEVELS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ATTRIBUTE_DIM_LEVEL_ATTRS


USER_ATTRIBUTE_DIM_LVL_CLASS


USER_ATTRIBUTE_DIM_ORDER_ATTRS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ATTRIBUTE_DIM_TABLES


USER_ATTRIBUTE_TRANSFORMATIONS


USER_AUDIT_OBJECT



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_AUDIT_POLICIES


USER_AUDIT_POLICY_COLUMNS


USER_AUDIT_SESSION



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_AUDIT_STATEMENT


USER_AUDIT_TRAIL


USER_AWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_AW_OBJ


USER_AW_PROP


USER_AW_PS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_BASE_TABLE_MVIEWS


USER_CATALOG


USER_CHANGE_NOTIFICATION_REGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CLUSTERING_DIMENSIONS


USER_CLUSTERING_JOINS


USER_CLUSTERING_KEYS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CLUSTERING_TABLES


USER_CLUSTERS


USER_CLUSTER_HASH_EXPRESSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CLU_COLUMNS


USER_CODE_ROLE_PRIVS


USER_COLL_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_COL_COMMENTS


USER_COL_PENDING_STATS


USER_COL_PRIVS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_COL_PRIVS_MADE


USER_COL_PRIVS_RECD


USER_COMPARISON



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_COMPARISON_COLUMNS


USER_COMPARISON_ROW_DIF


USER_COMPARISON_SCAN



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_COMPARISON_SCAN_SUMMARY


USER_COMPARISON_SCAN_VALUES


USER_CONSTRAINTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CONS_COLUMNS


USER_CONS_OBJ_COLUMNS


USER_CQ_NOTIFICATION_QUERIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CREDENTIALS


USER_CUBES


USER_CUBE_ATTRIBUTES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_ATTR_MAPPINGS


USER_CUBE_ATTR_UNIQUE_KEYS


USER_CUBE_ATTR_VISIBILITY



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_BUILD_PROCESSES


USER_CUBE_CALCULATED_MEMBERS


USER_CUBE_CLASSIFICATIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_DEPENDENCIES


USER_CUBE_DESCRIPTIONS


USER_CUBE_DIMENSIONALITY



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_DIMENSIONS


USER_CUBE_DIMNL_MAPPINGS


USER_CUBE_DIM_LEVELS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_DIM_MAPPINGS


USER_CUBE_DIM_MODELS


USER_CUBE_DIM_VIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_DIM_VIEW_COLUMNS


USER_CUBE_HIERARCHIES


USER_CUBE_HIER_LEVELS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_HIER_VIEWS


USER_CUBE_HIER_VIEW_COLUMNS


USER_CUBE_MAPPINGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_MEASURES


USER_CUBE_MEAS_MAPPINGS


USER_CUBE_NAMED_BUILD_SPECS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_CUBE_SUB_PARTITION_LEVELS


USER_CUBE_VIEWS


USER_CUBE_VIEW_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_DATAPUMP_JOBS


USER_DBFS_HS


USER_DBFS_HS_COMMANDS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_DBFS_HS_FILES


USER_DBFS_HS_FIXED_PROPERTIES


USER_DBFS_HS_PROPERTIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_DB_LINKS


USER_DEPENDENCIES


USER_DIMENSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_DIM_ATTRIBUTES


USER_DIM_CHILD_OF


USER_DIM_HIERARCHIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_DIM_JOIN_KEY


USER_DIM_LEVELS


USER_DIM_LEVEL_KEY



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_EDITIONED_TYPES


USER_EDITIONING_VIEWS


USER_EDITIONING_VIEWS_AE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_EDITIONING_VIEW_COLS


USER_EDITIONING_VIEW_COLS_AE


USER_ENCRYPTED_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_EPG_DAD_AUTHORIZATION


USER_ERRORS


USER_ERRORS_AE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ERROR_TRANSLATIONS


USER_EVALUATION_CONTEXTS


USER_EVALUATION_CONTEXT_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_EVALUATION_CONTEXT_VARS


USER_EXPRESSION_STATISTICS


USER_EXTENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_EXTERNAL_LOCATIONS


USER_EXTERNAL_TABLES


USER_FILE_GROUPS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_FILE_GROUP_EXPORT_INFO


USER_FILE_GROUP_FILES


USER_FILE_GROUP_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_FILE_GROUP_TABLESPACES


USER_FILE_GROUP_VERSIONS


USER_FLASHBACK_ARCHIVE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_FLASHBACK_ARCHIVE_TABLES


USER_FLASHBACK_TXN_REPORT


USER_FLASHBACK_TXN_STATE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_FREE_SPACE


USER_GOLDENGATE_PRIVILEGES


USER_HEAT_MAP_SEGMENT



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_HEAT_MAP_SEG_HISTOGRAM


USER_HIERARCHIES


USER_HIER_CLASS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_HIER_COLUMNS


USER_HIER_HIER_ATTRIBUTES


USER_HIER_HIER_ATTR_CLASS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_HIER_JOIN_PATHS


USER_HIER_LEVELS


USER_HIER_LEVEL_ID_ATTRS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_HOST_ACES


USER_IDENTIFIERS


USER_ILMDATAMOVEMENTPOLICIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ILMEVALUATIONDETAILS


USER_ILMOBJECTS


USER_ILMPOLICIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ILMRESULTS


USER_ILMTASKS


USER_IM_EXPRESSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_INDEXES


USER_INDEXTYPES


USER_INDEXTYPE_ARRAYTYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_INDEXTYPE_COMMENTS


USER_INDEXTYPE_OPERATORS


USER_IND_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_IND_COLUMNS_V$


USER_IND_EXPRESSIONS


USER_IND_PARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_IND_PENDING_STATS


USER_IND_STATISTICS


USER_IND_SUBPARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_INTERNAL_TRIGGERS


USER_JAVA_ARGUMENTS


USER_JAVA_CLASSES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_JAVA_COMPILER_OPTIONS


USER_JAVA_DERIVATIONS


USER_JAVA_FIELDS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_JAVA_IMPLEMENTS


USER_JAVA_INNERS


USER_JAVA_LAYOUTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_JAVA_METHODS


USER_JAVA_NCOMPS


USER_JAVA_POLICY



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_JAVA_RESOLVERS


USER_JAVA_THROWS


USER_JOBS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_JOINGROUPS


USER_JOIN_IND_COLUMNS


USER_JSON_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_JSON_DATAGUIDES


USER_JSON_DATAGUIDE_FIELDS


USER_LIBRARIES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_LOBS


USER_LOB_PARTITIONS


USER_LOB_SUBPARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_LOB_TEMPLATES


USER_LOG_GROUPS


USER_LOG_GROUP_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MEASURE_FOLDERS


USER_MEASURE_FOLDER_CONTENTS


USER_MEASURE_FOLDER_SUBFOLDERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_METADATA_PROPERTIES


USER_METHOD_PARAMS


USER_METHOD_RESULTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MINING_MODELS


USER_MINING_MODEL_ATTRIBUTES


USER_MINING_MODEL_PARTITIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MINING_MODEL_SETTINGS


USER_MINING_MODEL_VIEWS


USER_MINING_MODEL_XFORMS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MVIEWS


USER_MVIEW_AGGREGATES


USER_MVIEW_ANALYSIS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MVIEW_COMMENTS


USER_MVIEW_DETAIL_PARTITION


USER_MVIEW_DETAIL_RELATIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MVIEW_DETAIL_SUBPARTITION


USER_MVIEW_JOINS


USER_MVIEW_KEYS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MVIEW_LOGS


USER_MVIEW_REFRESH_TIMES


USER_MVREF_CHANGE_STATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MVREF_RUN_STATS


USER_MVREF_STATS


USER_MVREF_STATS_PARAMS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_MVREF_STATS_SYS_DEFAULTS


USER_MVREF_STMT_STATS


USER_NESTED_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_NESTED_TABLE_COLS


USER_NETWORK_ACL_PRIVILEGES


USER_OBJECTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_OBJECTS_AE


USER_OBJECT_SIZE


USER_OBJECT_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_OBJECT_USAGE


USER_OBJ_AUDIT_OPTS


USER_OBJ_COLATTRS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_OLDIMAGE_COLUMNS


USER_OPANCILLARY


USER_OPARGUMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_OPBINDINGS


USER_OPERATORS


USER_OPERATOR_COMMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_OUTLINES


USER_OUTLINE_HINTS


USER_PARALLEL_EXECUTE_CHUNKS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_PARALLEL_EXECUTE_TASKS


USER_PARTIAL_DROP_TABS


USER_PART_COL_STATISTICS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_PART_HISTOGRAMS


USER_PART_INDEXES


USER_PART_KEY_COLUMNS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_PART_KEY_COLUMNS_V$


USER_PART_LOBS


USER_PART_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_PASSWORD_LIMITS


USER_PENDING_CONV_TABLES


USER_PLSQL_COLL_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_PLSQL_OBJECT_SETTINGS


USER_PLSQL_TYPES


USER_PLSQL_TYPE_ATTRS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_POLICIES


USER_POLICY_ATTRIBUTES


USER_POLICY_CONTEXTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_POLICY_GROUPS


USER_PRIVATE_TEMP_TABLES


USER_PROCEDURES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_PROXIES


USER_QUEUES


USER_QUEUE_PUBLISHERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_QUEUE_SCHEDULES


USER_QUEUE_SUBSCRIBERS


USER_QUEUE_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_RECYCLEBIN


USER_REFRESH


USER_REFRESH_CHILDREN



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_REFS


USER_REGISTERED_MVIEWS


USER_REGISTERED_SNAPSHOTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_REGISTRY


USER_RESOURCE_LIMITS


USER_RESUMABLE



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_REWRITE_EQUIVALENCES


USER_ROLE_PRIVS


USER_RSRC_CONSUMER_GROUP_PRIVS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_RSRC_MANAGER_SYSTEM_PRIVS


USER_RULES


USER_RULESETS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_RULE_SETS


USER_RULE_SET_RULES


USER_SCHEDULER_CHAINS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_CHAIN_RULES


USER_SCHEDULER_CHAIN_STEPS


USER_SCHEDULER_CREDENTIALS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_DB_DESTS


USER_SCHEDULER_DESTS


USER_SCHEDULER_FILE_WATCHERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_GROUPS


USER_SCHEDULER_GROUP_MEMBERS


USER_SCHEDULER_INCOMPATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_INCOMPAT_MEMBER


USER_SCHEDULER_JOBS


USER_SCHEDULER_JOB_ARGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_JOB_DESTS


USER_SCHEDULER_JOB_LOG


USER_SCHEDULER_JOB_RUN_DETAILS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_NOTIFICATIONS


USER_SCHEDULER_PROGRAMS


USER_SCHEDULER_PROGRAM_ARGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_REMOTE_JOBSTATE


USER_SCHEDULER_RESOURCES


USER_SCHEDULER_RSC_CONSTRAINTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SCHEDULER_RUNNING_CHAINS


USER_SCHEDULER_RUNNING_JOBS


USER_SCHEDULER_SCHEDULES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SECONDARY_OBJECTS


USER_SEC_RELEVANT_COLS


USER_SEGMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SEQUENCES


USER_SNAPSHOTS


USER_SNAPSHOT_LOGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SOURCE


USER_SOURCE_AE


USER_SQLJ_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SQLJ_TYPE_ATTRS


USER_SQLJ_TYPE_METHODS


USER_SQLSET



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SQLSET_BINDS


USER_SQLSET_PLANS


USER_SQLSET_REFERENCES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SQLSET_STATEMENTS


USER_SQLTUNE_BINDS


USER_SQLTUNE_PLANS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SQLTUNE_RATIONALE_PLAN


USER_SQLTUNE_STATISTICS


USER_SQL_TRANSLATIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SQL_TRANSLATION_PROFILES


USER_SR_GRP_STATUS


USER_SR_GRP_STATUS_ALL



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SR_OBJ


USER_SR_OBJ_ALL


USER_SR_OBJ_STATUS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SR_OBJ_STATUS_ALL


USER_SR_PARTN_OPS


USER_SR_STLOG_EXCEPTIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SR_STLOG_STATS


USER_STATEMENTS


USER_STAT_EXTENSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_STORED_SETTINGS


USER_SUBPARTITION_TEMPLATES


USER_SUBPART_COL_STATISTICS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SUBPART_HISTOGRAMS


USER_SUBPART_KEY_COLUMNS


USER_SUBPART_KEY_COLUMNS_V$



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SUBSCR_REGISTRATIONS


USER_SUMMARIES


USER_SUMMARY_AGGREGATES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SUMMARY_DETAIL_TABLES


USER_SUMMARY_JOINS


USER_SUMMARY_KEYS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_SYNONYMS


USER_SYS_PRIVS


USER_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TABLESPACES


USER_TAB_COLS


USER_TAB_COLS_V$



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TAB_COLUMNS


USER_TAB_COL_STATISTICS


USER_TAB_COMMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TAB_HISTGRM_PENDING_STATS


USER_TAB_HISTOGRAMS


USER_TAB_IDENTITY_COLS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TAB_MODIFICATIONS


USER_TAB_PARTITIONS


USER_TAB_PENDING_STATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TAB_PRIVS


USER_TAB_PRIVS_MADE


USER_TAB_PRIVS_RECD



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TAB_STATISTICS


USER_TAB_STATS_HISTORY


USER_TAB_STAT_PREFS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TAB_SUBPARTITIONS


USER_TRANSFORMATIONS


USER_TRIGGERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TRIGGERS_AE


USER_TRIGGER_COLS


USER_TRIGGER_ORDERING



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TS


USER_TSTZ_TABLES


USER_TSTZ_TAB_COLS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TS_QUOTAS


USER_TUNE_MVIEW


USER_TYPES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_TYPE_ATTRS


USER_TYPE_METHODS


USER_TYPE_VERSIONS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_UNUSED_COL_TABS


USER_UPDATABLE_COLUMNS


USER_USERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_USTATS


USER_VARRAYS


USER_VIEWS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_VIEWS_AE


USER_WALLET_ACES


USER_WARNING_SETTINGS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XDS_ACL_REFRESH


USER_XDS_ACL_REFSTAT


USER_XDS_LATEST_ACL_REFSTAT



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XMLTYPE_COLS


USER_XML_COLUMN_NAMES


USER_XML_INDEXES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XML_NESTED_TABLES


USER_XML_OUT_OF_LINE_TABLES


USER_XML_SCHEMAS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XML_SCHEMA_ATTRIBUTES


USER_XML_SCHEMA_COMPLEX_TYPES


USER_XML_SCHEMA_ELEMENTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XML_SCHEMA_NAMESPACES


USER_XML_SCHEMA_SIMPLE_TYPES


USER_XML_SCHEMA_SUBSTGRP_HEAD



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XML_SCHEMA_SUBSTGRP_MBRS


USER_XML_TABLES


USER_XML_TAB_COLS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XML_VIEWS


USER_XML_VIEW_COLS


USER_XS_ACES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XS_ACLS


USER_XS_ACL_PARAMETERS


USER_XS_COLUMN_CONSTRAINTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XS_IMPLIED_PRIVILEGES


USER_XS_INHERITED_REALMS


USER_XS_PASSWORD_LIMITS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XS_POLICIES


USER_XS_PRIVILEGES


USER_XS_REALM_CONSTRAINTS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XS_SECURITY_CLASSES


USER_XS_SECURITY_CLASS_DEP


USER_XS_USERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XTERNAL_LOC_PARTITIONS


USER_XTERNAL_LOC_SUBPARTITIONS


USER_XTERNAL_PART_TABLES



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_XTERNAL_TAB_PARTITIONS


USER_XTERNAL_TAB_SUBPARTITIONS


USER_ZONEMAPS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_ZONEMAP_MEASURES


DATABASE_COMPATIBLE_LEVEL


DBMS_LOCK_ALLOCATED



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
SESSION_ROLES


DICT_COLUMNS


NLS_SESSION_PARAMETERS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
AUDIT_ACTIONS


DUAL


INDEX_STATS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
RESOURCE_COST


COLUMN_PRIVILEGES


ROLE_SYS_PRIVS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
TABLE_PRIVILEGES


SESSION_PRIVS


DBMS_ALERT_INFO



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
INDEX_HISTOGRAM


NLS_INSTANCE_PARAMETERS


ROLE_ROLE_PRIVS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
DICTIONARY


NLS_DATABASE_PARAMETERS


ROLE_TAB_PRIVS



TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
GLOBAL_NAME



958 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select * from dictionary
  2* where table_name='USER_OBJECTS'
SQL> /

TABLE_NAME
--------------------------------------------------------------------------------
COMMENTS
--------------------------------------------------------------------------------
USER_OBJECTS



SQL> desc user_tables
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TABLE_NAME                                NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                    VARCHAR2(30)
 CLUSTER_NAME                                       VARCHAR2(128)
 IOT_NAME                                           VARCHAR2(128)
 STATUS                                             VARCHAR2(8)
 PCT_FREE                                           NUMBER
 PCT_USED                                           NUMBER
 INI_TRANS                                          NUMBER
 MAX_TRANS                                          NUMBER
 INITIAL_EXTENT                                     NUMBER
 NEXT_EXTENT                                        NUMBER
 MIN_EXTENTS                                        NUMBER
 MAX_EXTENTS                                        NUMBER
 PCT_INCREASE                                       NUMBER
 FREELISTS                                          NUMBER
 FREELIST_GROUPS                                    NUMBER
 LOGGING                                            VARCHAR2(3)
 BACKED_UP                                          VARCHAR2(1)
 NUM_ROWS                                           NUMBER
 BLOCKS                                             NUMBER
 EMPTY_BLOCKS                                       NUMBER
 AVG_SPACE                                          NUMBER
 CHAIN_CNT                                          NUMBER
 AVG_ROW_LEN                                        NUMBER
 AVG_SPACE_FREELIST_BLOCKS                          NUMBER
 NUM_FREELIST_BLOCKS                                NUMBER
 DEGREE                                             VARCHAR2(10)
 INSTANCES                                          VARCHAR2(10)
 CACHE                                              VARCHAR2(5)
 TABLE_LOCK                                         VARCHAR2(8)
 SAMPLE_SIZE                                        NUMBER
 LAST_ANALYZED                                      DATE
 PARTITIONED                                        VARCHAR2(3)
 IOT_TYPE                                           VARCHAR2(12)
 TEMPORARY                                          VARCHAR2(1)
 SECONDARY                                          VARCHAR2(1)
 NESTED                                             VARCHAR2(3)
 BUFFER_POOL                                        VARCHAR2(7)
 FLASH_CACHE                                        VARCHAR2(7)
 CELL_FLASH_CACHE                                   VARCHAR2(7)
 ROW_MOVEMENT                                       VARCHAR2(8)
 GLOBAL_STATS                                       VARCHAR2(3)
 USER_STATS                                         VARCHAR2(3)
 DURATION                                           VARCHAR2(15)
 SKIP_CORRUPT                                       VARCHAR2(8)
 MONITORING                                         VARCHAR2(3)
 CLUSTER_OWNER                                      VARCHAR2(128)
 DEPENDENCIES                                       VARCHAR2(8)
 COMPRESSION                                        VARCHAR2(8)
 COMPRESS_FOR                                       VARCHAR2(30)
 DROPPED                                            VARCHAR2(3)
 READ_ONLY                                          VARCHAR2(3)
 SEGMENT_CREATED                                    VARCHAR2(3)
 RESULT_CACHE                                       VARCHAR2(7)
 CLUSTERING                                         VARCHAR2(3)
 ACTIVITY_TRACKING                                  VARCHAR2(23)
 DML_TIMESTAMP                                      VARCHAR2(25)
 HAS_IDENTITY                                       VARCHAR2(3)
 CONTAINER_DATA                                     VARCHAR2(3)
 INMEMORY                                           VARCHAR2(8)
 INMEMORY_PRIORITY                                  VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                VARCHAR2(15)
 INMEMORY_COMPRESSION                               VARCHAR2(17)
 INMEMORY_DUPLICATE                                 VARCHAR2(13)
 DEFAULT_COLLATION                                  VARCHAR2(100)
 DUPLICATED                                         VARCHAR2(1)
 SHARDED                                            VARCHAR2(1)
 EXTERNAL                                           VARCHAR2(3)
 HYBRID                                             VARCHAR2(3)
 CELLMEMORY                                         VARCHAR2(24)
 CONTAINERS_DEFAULT                                 VARCHAR2(3)
 CONTAINER_MAP                                      VARCHAR2(3)
 EXTENDED_DATA_LINK                                 VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                             VARCHAR2(3)
 INMEMORY_SERVICE                                   VARCHAR2(12)
 INMEMORY_SERVICE_NAME                              VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                               VARCHAR2(3)
 MEMOPTIMIZE_READ                                   VARCHAR2(8)
 MEMOPTIMIZE_WRITE                                  VARCHAR2(8)
 HAS_SENSITIVE_COLUMN                               VARCHAR2(3)
 ADMIT_NULL                                         VARCHAR2(3)
 DATA_LINK_DML_ENABLED                              VARCHAR2(3)
 LOGICAL_REPLICATION                                VARCHAR2(8)

SQL> desc all tables
Usage: DESCRIBE [schema.]object[@db_link]
SQL> desc * tables
SP2-0565: Illegal identifier.
SQL> DESC all_tables
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 OWNER                                     NOT NULL VARCHAR2(128)
 TABLE_NAME                                NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                    VARCHAR2(30)
 CLUSTER_NAME                                       VARCHAR2(128)
 IOT_NAME                                           VARCHAR2(128)
 STATUS                                             VARCHAR2(8)
 PCT_FREE                                           NUMBER
 PCT_USED                                           NUMBER
 INI_TRANS                                          NUMBER
 MAX_TRANS                                          NUMBER
 INITIAL_EXTENT                                     NUMBER
 NEXT_EXTENT                                        NUMBER
 MIN_EXTENTS                                        NUMBER
 MAX_EXTENTS                                        NUMBER
 PCT_INCREASE                                       NUMBER
 FREELISTS                                          NUMBER
 FREELIST_GROUPS                                    NUMBER
 LOGGING                                            VARCHAR2(3)
 BACKED_UP                                          VARCHAR2(1)
 NUM_ROWS                                           NUMBER
 BLOCKS                                             NUMBER
 EMPTY_BLOCKS                                       NUMBER
 AVG_SPACE                                          NUMBER
 CHAIN_CNT                                          NUMBER
 AVG_ROW_LEN                                        NUMBER
 AVG_SPACE_FREELIST_BLOCKS                          NUMBER
 NUM_FREELIST_BLOCKS                                NUMBER
 DEGREE                                             VARCHAR2(10)
 INSTANCES                                          VARCHAR2(10)
 CACHE                                              VARCHAR2(5)
 TABLE_LOCK                                         VARCHAR2(8)
 SAMPLE_SIZE                                        NUMBER
 LAST_ANALYZED                                      DATE
 PARTITIONED                                        VARCHAR2(3)
 IOT_TYPE                                           VARCHAR2(12)
 TEMPORARY                                          VARCHAR2(1)
 SECONDARY                                          VARCHAR2(1)
 NESTED                                             VARCHAR2(3)
 BUFFER_POOL                                        VARCHAR2(7)
 FLASH_CACHE                                        VARCHAR2(7)
 CELL_FLASH_CACHE                                   VARCHAR2(7)
 ROW_MOVEMENT                                       VARCHAR2(8)
 GLOBAL_STATS                                       VARCHAR2(3)
 USER_STATS                                         VARCHAR2(3)
 DURATION                                           VARCHAR2(15)
 SKIP_CORRUPT                                       VARCHAR2(8)
 MONITORING                                         VARCHAR2(3)
 CLUSTER_OWNER                                      VARCHAR2(128)
 DEPENDENCIES                                       VARCHAR2(8)
 COMPRESSION                                        VARCHAR2(8)
 COMPRESS_FOR                                       VARCHAR2(30)
 DROPPED                                            VARCHAR2(3)
 READ_ONLY                                          VARCHAR2(3)
 SEGMENT_CREATED                                    VARCHAR2(3)
 RESULT_CACHE                                       VARCHAR2(7)
 CLUSTERING                                         VARCHAR2(3)
 ACTIVITY_TRACKING                                  VARCHAR2(23)
 DML_TIMESTAMP                                      VARCHAR2(25)
 HAS_IDENTITY                                       VARCHAR2(3)
 CONTAINER_DATA                                     VARCHAR2(3)
 INMEMORY                                           VARCHAR2(8)
 INMEMORY_PRIORITY                                  VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                VARCHAR2(15)
 INMEMORY_COMPRESSION                               VARCHAR2(17)
 INMEMORY_DUPLICATE                                 VARCHAR2(13)
 DEFAULT_COLLATION                                  VARCHAR2(100)
 DUPLICATED                                         VARCHAR2(1)
 SHARDED                                            VARCHAR2(1)
 EXTERNAL                                           VARCHAR2(3)
 HYBRID                                             VARCHAR2(3)
 CELLMEMORY                                         VARCHAR2(24)
 CONTAINERS_DEFAULT                                 VARCHAR2(3)
 CONTAINER_MAP                                      VARCHAR2(3)
 EXTENDED_DATA_LINK                                 VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                             VARCHAR2(3)
 INMEMORY_SERVICE                                   VARCHAR2(12)
 INMEMORY_SERVICE_NAME                              VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                               VARCHAR2(3)
 MEMOPTIMIZE_READ                                   VARCHAR2(8)
 MEMOPTIMIZE_WRITE                                  VARCHAR2(8)
 HAS_SENSITIVE_COLUMN                               VARCHAR2(3)
 ADMIT_NULL                                         VARCHAR2(3)
 DATA_LINK_DML_ENABLED                              VARCHAR2(3)
 LOGICAL_REPLICATION                                VARCHAR2(8)

SQL> select object_name from user_objects
  2  /

OBJECT_NAME
--------------------------------------------------------------------------------
REGIONS
REG_ID_PK
COUNTRIES
COUNTRY_C_ID_PK
LOCATIONS
LOC_ID_PK
LOCATIONS_SEQ
DEPARTMENTS
DEPT_ID_PK
DEPARTMENTS_SEQ
JOBS

OBJECT_NAME
--------------------------------------------------------------------------------
JOB_ID_PK
EMPLOYEES
EMP_EMAIL_UK
EMP_EMP_ID_PK
EMPLOYEES_SEQ
JOB_HISTORY
JHIST_EMP_ID_ST_DATE_PK
EMP_DETAILS_VIEW
EMP_DEPARTMENT_IX
EMP_JOB_IX
EMP_MANAGER_IX

OBJECT_NAME
--------------------------------------------------------------------------------
EMP_NAME_IX
DEPT_LOCATION_IX
JHIST_JOB_IX
JHIST_EMPLOYEE_IX
JHIST_DEPARTMENT_IX
LOC_CITY_IX
LOC_STATE_PROVINCE_IX
LOC_COUNTRY_IX
SECURE_DML
SECURE_EMPLOYEES
ADD_JOB_HISTORY

OBJECT_NAME
--------------------------------------------------------------------------------
UPDATE_JOB_HISTORY
TEST_CONVERTION
COPY_EMP
DEPT
TEST_CONS
SYS_C007687
TC_ID_PK
TEST_CONS1
TEST_CONS2
TC2_ID_PK
DEPT11

OBJECT_NAME
--------------------------------------------------------------------------------
SYS_C007696
EMP11
SYS_C007698
TEACH_EMP
SYS_C007703
SYS_IL0000073303C00007$$
SYS_LOB0000073303C00007$$
SYS_C007704

52 rows selected.

SQL>