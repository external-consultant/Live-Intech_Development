pageextension 50121 SalesQuoteExtVJ extends "Sales Quote"
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
    }

}