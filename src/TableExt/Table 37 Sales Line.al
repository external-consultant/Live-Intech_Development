tableextension 50117 SalesLineExt extends "Sales Line"
{
    fields
    {
        //T50219-NS-NB
        modify(LineHSNCode)
        {
            trigger OnAfterValidate()
            var
                SalesHeader_lRec: Record "Sales Header";
            begin
                SalesHeader_lRec.Reset();
                if SalesHeader_lRec.Get(Rec."Document Type", REc."Document No.") then
                    if rec.LineHSNCode <> rec.HSNCode then begin
                        SalesHeader_lRec."Required Approval" := true;
                        SalesHeader_lRec.Modify();
                    end else begin
                        SalesHeader_lRec."Required Approval" := false;
                        SalesHeader_lRec.Modify();
                    end;
            end;
        }
        modify(LineCountryOfOrigin)
        {
            trigger OnAfterValidate()
            var
                SalesHeader_lRec: Record "Sales Header";
            begin
                SalesHeader_lRec.Reset();
                if SalesHeader_lRec.Get(Rec."Document Type", REc."Document No.") then
                    if rec.LineCountryOfOrigin <> rec.CountryOfOrigin then begin
                        SalesHeader_lRec."Required Approval" := true;
                        SalesHeader_lRec.Modify();
                    end else begin
                        SalesHeader_lRec."Required Approval" := false;
                        SalesHeader_lRec.Modify();
                    end;
            end;
        }
        //T50219-NE-NB
    }

}