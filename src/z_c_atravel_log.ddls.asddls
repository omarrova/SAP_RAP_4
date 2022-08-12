@EndUserText.label: 'comsumption - Travel Approval'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true 
define root view entity Z_C_aTRAVEL_LOG
  as projection on z_i_travel_log
{

  key travel_id       as TravelID,
      @ObjectModel.text.element: ['AgencyName']
      agency_id       as AgencyID,
      _Agency.Name    as AgencyName,
      @ObjectModel.text.element: ['CustomerName']
      customer_id     as CustomerID,
      _Customer.LastName as CustomerName,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      total_price     as TotalPrice,
       @Semantics.currencyCode: true
      currency_code   as CurrencyCode,
      description     as Description,
      overall_status  as TravelStatus,
      last_changed_by as LastChangedAt,
      /* Associations */
      _Booking : redirected to composition child z_c_abooking_log,
      _Customer
}
