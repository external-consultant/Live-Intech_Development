codeunit 50106 Subscribe414BugFix
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeCalcInvDiscount, '', false, false)]
    local procedure ReleaseSalesDocument_OnBeforeCalcInvDiscount(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var LinesWereModified: Boolean; var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    var
        SalesSetup: Record "Sales & Receivables Setup";
        PostingDate: Date;
        PrintPostedDocuments: Boolean;
    begin
        //DM-BugFix-NS
        if SalesHeader.Status = SalesHeader.Status::"Pending Approval" then begin
            SalesSetup.Get();
            if SalesSetup."Calc. Inv. Discount" then begin
                PostingDate := SalesHeader."Posting Date";
                PrintPostedDocuments := SalesHeader."Print Posted Documents";
                CODEUNIT.Run(CODEUNIT::"Sales-Calc. Discount Intech", SalesLine); //DM-BugFix-N
                LinesWereModified := true;
                SalesHeader.Get(SalesHeader."Document Type", SalesHeader."No.");
                SalesHeader."Print Posted Documents" := PrintPostedDocuments;
                if PostingDate <> SalesHeader."Posting Date" then
                    SalesHeader.Validate("Posting Date", PostingDate);
                IsHandled := true; ////DM-BugFix-N
            end;
        end;
        //DM-BugFix-NE
    end;

}
