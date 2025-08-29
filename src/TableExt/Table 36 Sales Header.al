tableextension 50116 SalesHdrExt extends "Sales Header"
{
    fields
    {
        field(50150; "Required Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'T50268';
            Editable = false;
        }
        //T50219-NS-NB
        modify("Payment Terms Code")
        {
            trigger OnAfterValidate()
            var
                Customer_lRec: Record Customer;
            begin
                if rec."Sell-to Customer No." <> '' then
                    if Customer_lRec.Get("Sell-to Customer No.") then
                        if not (Customer_lRec."Payment Terms Code" = rec."Payment Terms Code") then begin
                            rec."Required Approval" := true;
                            if rec.Modify() then;
                        end else begin
                            rec."Required Approval" := false;
                            if rec.Modify() then;
                        end;
            end;
        }
        //T50219-NE-NB
    }

    keys
    {
        // Add changes to keys here
    }

    var
        myInt: Integer;
}