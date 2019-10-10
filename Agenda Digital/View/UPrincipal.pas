unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.StdCtrls, FMX.Objects,
  FMX.ListBox, FMX.Layouts, FMX.Edit, FMX.TabControl, FMX.Ani, System.Actions,
  FMX.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDWConstsData,
  uRESTDWPoolerDB, uDWAbout, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  MultiDetailAppearanceU;

type
  TfrmMenuPrincipal = class(TForm)
    MultiView: TMultiView;
    ListBox1: TListBox;
    Cadastrar: TListBoxItem;
    Relatorio: TListBoxItem;
    Alterar: TListBoxItem;
    TabControl1: TTabControl;
    tabPrincipal: TTabItem;
    tabCadastrar: TTabItem;
    tabRelatorio: TTabItem;
    tabAlterar: TTabItem;
    EditNome: TEdit;
    layoutGravar: TLayout;
    lbNome: TLabel;
    EditCidade: TEdit;
    EditUF: TEdit;
    lbUF: TLabel;
    EditCelular: TEdit;
    lbCelular: TLabel;
    lbCidade: TLabel;
    layoutID: TLayout;
    layoutEndereco: TLayout;
    layoutFone: TLayout;
    layoutEndereco2: TLayout;
    FundoDeTela: TRectangle;
    ActionList1: TActionList;
    ChangeTab: TChangeTabAction;
    btMultiView: TImage;
    LayoutTopMenuPrincipal: TLayout;
    RESTDWDataBase1: TRESTDWDataBase;
    btGravar: TSpeedButton;
    rectGravar: TRectangle;
    ListView1: TListView;
    LayoutTopoRelatorio: TLayout;
    TopRelatorio: TRectangle;
    CenterRelatorio: TRectangle;
    btPesquisar: TImage;
    RESTSQL: TRESTDWClientSQL;
    DataSource1: TDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    RESTSQLmanutencao: TRESTDWClientSQL;
    layoutTopoGravar: TLayout;
    Label1: TLabel;
    FundoDeTelaAlterar: TRectangle;
    layoutAlterar: TLayout;
    layoutNomeAltera: TLayout;
    lbNomeAltera: TLabel;
    EditNomeAltera: TEdit;
    layoutEnderecoAltera: TLayout;
    lbCidadeAltera: TLabel;
    EditCidadeAltera: TEdit;
    layoutEnderecoAltera2: TLayout;
    EditUFAltera: TEdit;
    lbUFAltera: TLabel;
    layoutTelefoneAltera: TLayout;
    EditCelularAltera: TEdit;
    lbCelularAltera: TLabel;
    recAlterar: TRectangle;
    btAltera: TSpeedButton;
    layoutTopoAlterar: TLayout;
    btPesquisaAlterar: TImage;
    lbAlterar: TLabel;
    layoutIDALtera: TLayout;
    lbIDALtera: TLabel;
    EditIdAltera: TEdit;
    RESTDWSQL: TRESTDWClientSQL;
    BindSourceDB2: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    ButtonDelete: TImage;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    Line1: TLine;
    Image1: TImage;
    Line2: TLine;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure CadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RelatorioClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure rectGravarClick(Sender: TObject);
    procedure btPesquisaAlterarClick(Sender: TObject);
    procedure recAlterarClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure btAlteraClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);

    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.fmx}

procedure TfrmMenuPrincipal.ButtonDeleteClick(Sender: TObject);
begin

begin


   try
      RESTSQLmanutencao.Close;
      RESTSQLmanutencao.SQL.Clear;
      RESTSQLmanutencao.SQL.Add('DELETE FROM contato Where id_contato =:id_contato');
      RESTSQLmanutencao.ParamByName('id_contato').AsString := RESTSQL.FieldByName('id_contato').AsString;
      RESTSQLmanutencao.ExecSql();

      RESTSQL.Close();
      RESTSQL.Open();

      ShowMessage('EXCLUIDO com sucesso!');


  except
    on e : Exception do
    begin
      ShowMessage('Erro ao Excluir: ' + e.Message);
    end;

  end;
end;
end;

 //Fazendo DELETE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  procedure TfrmMenuPrincipal.recAlterarClick(Sender: TObject);
begin

  try

        // Fazendo Update
        RESTSQLmanutencao.Close;
        RESTSQLmanutencao.SQL.Clear;
        RESTSQLmanutencao.SQL.Add(' UPDATE contato SET nome_contato =:nome_contato,  cidade_contato =:cidade_contato, uf_contato =:uf_contato, cel_contato =:cel_contato where id_contato = :id_contato ');

        RESTSQLmanutencao.ParamByName('id_contato').AsString    := EditIdAltera.Text;

        RESTSQLmanutencao.ParamByName('nome_contato').AsString    := EditNomeAltera.Text;
        RESTSQLmanutencao.ParamByName('cidade_contato').AsString    := EditCidadeAltera.Text;
        RESTSQLmanutencao.ParamByName('uf_contato').AsString    := EditUFAltera.Text;
        RESTSQLmanutencao.ParamByName('cel_contato').AsString    := EditCelularAltera.Text;
        RESTSQLmanutencao.ExecSQL();



      //Tratamento de ERRO

        except
          on E : exception do
            begin
              ShowMessage('Erro ao fazer Alteração !');
              exit;
            end;

  end;
end;

procedure TfrmMenuPrincipal.btAlteraClick(Sender: TObject);
begin
    try
        // Fazendo Update
        RESTSQLmanutencao.Close;
        RESTSQLmanutencao.SQL.Clear;
        RESTSQLmanutencao.SQL.Add(' UPDATE contato SET nome_contato =:nome_contato,  cidade_contato =:cidade_contato, uf_contato =:uf_contato, cel_contato =:cel_contato where id_contato = :id_contato ');

        RESTSQLmanutencao.ParamByName('id_contato').AsString    := EditIdAltera.Text;

        RESTSQLmanutencao.ParamByName('nome_contato').AsString    := EditNomeAltera.Text;
        RESTSQLmanutencao.ParamByName('cidade_contato').AsString    := EditCidadeAltera.Text;
        RESTSQLmanutencao.ParamByName('uf_contato').AsString    := EditUFAltera.Text;
        RESTSQLmanutencao.ParamByName('cel_contato').AsString    := EditCelularAltera.Text;
        RESTSQLmanutencao.ExecSQL();



      //Tratamento de ERRO

        except
          on E : exception do
            begin
              ShowMessage('Erro ao fazer Alteração !');
              exit;
            end;
    end;
end;
// Comando UpDate ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~




procedure TfrmMenuPrincipal.rectGravarClick(Sender: TObject);
begin


      try

        // Fazendo insert
        RESTSQLmanutencao.Close;
        RESTSQLmanutencao.SQL.Clear;
        RESTSQLmanutencao.SQL.Add(' insert into contato ( nome_contato, cidade_contato, uf_contato, cel_contato ) VALUES ( :nome_contato, :cidade_contato, :uf_contato, :cel_contato )');
        RESTSQLmanutencao.ParamByName('nome_contato').AsString    := EditNome.Text;
        RESTSQLmanutencao.ParamByName('cidade_contato').AsString  := EditCidade.Text;
        RESTSQLmanutencao.ParamByName('uf_contato').AsString      := EditUF.Text;
        RESTSQLmanutencao.ParamByName('cel_contato').AsString     := EditCelular.Text;
        RESTSQLmanutencao.ExecSQL();



      //Tratamento de ERRO

        except
          on E : exception do
            begin
              ShowMessage('Erro ao inserir dados !');
              exit;
            end;

      end;
end;
procedure TfrmMenuPrincipal.btGravarClick(Sender: TObject);
begin


      try

        // Fazendo insert
        RESTSQLmanutencao.Close;
        RESTSQLmanutencao.SQL.Clear;
        RESTSQLmanutencao.SQL.Add(' insert into contato ( nome_contato, cidade_contato, uf_contato, cel_contato ) VALUES ( :nome_contato, :cidade_contato, :uf_contato, :cel_contato )');
        RESTSQLmanutencao.ParamByName('nome_contato').AsString    := EditNome.Text;
        RESTSQLmanutencao.ParamByName('cidade_contato').AsString  := EditCidade.Text;
        RESTSQLmanutencao.ParamByName('uf_contato').AsString      := EditUF.Text;
        RESTSQLmanutencao.ParamByName('cel_contato').AsString     := EditCelular.Text;
        RESTSQLmanutencao.ExecSQL();



      //Tratamento de ERRO

        except
          on E : exception do
            begin
              ShowMessage('Erro ao inserir dados !');
              exit;
            end;

      end;
end;
//Comando INSERT ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^





procedure TfrmMenuPrincipal.btPesquisaAlterarClick(Sender: TObject);
begin


       try
        RESTDWSQL.Close;
        RESTDWSQL.SQL.Clear;
        RESTDWSQl.SQL.Add('SELECT nome_contato,cidade_contato,uf_contato, cel_contato FROM contato WHERE id_contato =:id_contato');
        RESTDWSQL.ParamByName('id_contato').AsString    := EditIdAltera.Text;
        RESTDWSQL.Active := true;
        RESTDWSQL.Open();

        except
         ShowMessage('Erro ao buscar dados!');
        end;
end;
// Fazendo PESQUISA PARA ALTERAÇÂO ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


procedure TfrmMenuPrincipal.btPesquisarClick(Sender: TObject);
begin

      //Fazendo Select
      // Tratamento de ERRO
      try
        RESTSQL.Active := False;
        RESTSQL.Active := true;
        RESTSQL.Open();

        except
         ShowMessage('Erro ao buscar dados');
        end;

end;
      //Fazendo Select do Relatorio ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


procedure TfrmMenuPrincipal.CadastrarClick(Sender: TObject);
begin
    ChangeTab.Tab := tabCadastrar;
      ChangeTab.ExecuteTarget(self);
end;

procedure TfrmMenuPrincipal.AlterarClick(Sender: TObject);
begin
    ChangeTab.Tab := tabAlterar;
      ChangeTab.ExecuteTarget(self);
end;

procedure TfrmMenuPrincipal.RelatorioClick(Sender: TObject);
begin
    ChangeTab.Tab := tabRelatorio;
      ChangeTab.ExecuteTarget(self);
end;
//Troca de Tab ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
var Thread : TThread;
begin

    // Criando thread
    Thread :=
      TThread.CreateAnonymousThread(
          Procedure ()
          begin
              try
                  RESTDWDataBase1.Active  := True;

              except

                  ShowMessage('Erro Conexão !!');

              end;
          end
      );
      Thread.Start;
      // Iniciando a thread
end;
// Conectando no banco pelo WebService^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end.
