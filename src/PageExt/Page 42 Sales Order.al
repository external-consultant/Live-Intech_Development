pageextension 50132 SalesOrderExtenedVJ extends "Sales Order"
{
    layout
    {
        addlast(General)
        {

            field("Required Approval"; Rec."Required Approval")
            {
                ApplicationArea = All;
                Description = 'T50268';
                ToolTip = 'Specifies the value of the Required Approval field.', Comment = '%';
            }
        }
        //T50219-NS-NB
        modify(ShippingOptions)
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                if not (ShipToOptions = ShipToOptions::"Default (Sell-to Address)") then begin
                    rec."Required Approval" := true;
                    rec.Modify();
                end else begin
                    rec."Required Approval" := false;
                    rec.Modify();
                end;
            end;
        }
        //T50219-NE-NB
    }


}