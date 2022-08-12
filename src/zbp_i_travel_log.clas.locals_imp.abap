CLASS lhc_travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR travel RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR travel RESULT result.

    METHODS accepttravel FOR MODIFY
      IMPORTING keys FOR ACTION travel~accepttravel RESULT result.

    METHODS createbytemplate FOR MODIFY
      IMPORTING keys FOR ACTION travel~createbytemplate RESULT result.

    METHODS rejecttravel FOR MODIFY
      IMPORTING keys FOR ACTION travel~rejecttravel RESULT result.

    METHODS validatecustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR travel~validatecustomer.

    METHODS validatedete FOR VALIDATE ON SAVE
      IMPORTING keys FOR travel~validatedete.

    METHODS validatestatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR travel~validatestatus.

ENDCLASS.

CLASS lhc_travel IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD accepttravel.
  ENDMETHOD.

  METHOD createbytemplate.

    READ ENTITIES  OF z_i_travel_log
    entity travel
    fields ( travel_id agency_id customer_id booking_fee total_price currency_code )
    with value #( for row_key in keys ( %key = row_key-%key ) )
    result DATA(lt_read_entity_travel)
    failed failed
    reported reported.

*    READ ENTITIES  OF z_i_travel_log
*    entity travel
*    fields ( travel_id agency_id customer_id booking_fee total_price currency_code )
*    with value #( for row_key in keys ( %key = row_key-%key ) )
*    result lt_read_entity_travel
*    failed failed
*    reported reported.

*data lt_create_travel type table for create z_i_travel_log\\travel.
*
*lt_create_travel = value #( for result_row in lt_read_entity_travel index into idx
*                             travel_id =  )


  ENDMETHOD.

  METHOD rejecttravel.
  ENDMETHOD.

  METHOD validatecustomer.
  ENDMETHOD.

  METHOD validatedete.
  ENDMETHOD.

  METHOD validatestatus.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_I_TRAVEL_LOG DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z_I_TRAVEL_LOG IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
