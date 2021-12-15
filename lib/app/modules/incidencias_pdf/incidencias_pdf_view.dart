import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidencias2/app/data/models/fichas_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'incidencias_pdf_logic.dart';

class IncidenciasPdfPage extends GetView<IncidenciasPdfLogic> {
  const IncidenciasPdfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final web = size.width > 800;
    return GetBuilder<IncidenciasPdfLogic>(
        id: 'incidencia',
        builder: (_) {
          final incidencesModel = controller.incidencesModel;
          final fichasModel = controller.fichasModel;
          return PdfPreview(build: (format) {
            final pdf = pw.Document();
            pdf.addPage(pw.MultiPage(orientation: pw.PageOrientation.landscape,
                pageFormat: format,
                build: (context) => [
                      pw.Text('Incidente',
                          style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.black)),
                      pw.SizedBox(height: 10),
                      incidencesModel != null &&
                              incidencesModel.incides.isNotEmpty
                          ? pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              children: [
                                pw.Container(
                                  width: size.width * 0.2,
                                  height: 150,
                                  decoration: pw.BoxDecoration(
                                      borderRadius:
                                          pw.BorderRadius.circular(15),
                                      border:
                                          pw.Border.all(color: PdfColors.blue)),
                                  padding: const pw.EdgeInsets.all(10),
                                  child: pw.Align(
                                    alignment: pw.Alignment.topLeft,
                                    child: pw.FittedBox(
                                      fit: pw.BoxFit.scaleDown,
                                      child: pw.RichText(
                                          text: pw.TextSpan(children: [
                                        pw.TextSpan(
                                            text: 'Datos de incidencia\n',
                                            style: pw.TextStyle(
                                                fontSize: 18,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: '\nDescripción: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].descripcion),
                                        pw.TextSpan(
                                            text: '\nUsuario: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].usuario),
                                      ])),
                                    ),
                                  ),
                                ),
                                pw.Container(
                                  width: size.width * 0.2,
                                  height: 150,
                                  decoration: pw.BoxDecoration(
                                      borderRadius:
                                          pw.BorderRadius.circular(15),
                                      border:
                                          pw.Border.all(color: PdfColors.blue)),
                                  padding: const pw.EdgeInsets.all(10),
                                  child: pw.Align(
                                    alignment: pw.Alignment.topLeft,
                                    child: pw.FittedBox(
                                      fit: pw.BoxFit.scaleDown,
                                      child: pw.RichText(
                                          text: pw.TextSpan(children: [
                                        pw.TextSpan(
                                            text:
                                                'Datos de la institución educativa\n',
                                            style: pw.TextStyle(
                                                fontSize: 18,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: '\nNombre de la IE: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].instEduc),
                                        pw.TextSpan(
                                            text: '\nCódigo modular: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].codModul),
                                        pw.TextSpan(
                                            text: '\nCódigo local: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].codLocal),
                                        pw.TextSpan(
                                            text: '\nDistrito: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].distrito),
                                        pw.TextSpan(
                                            text: '\nProvincia: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].provincia),
                                        pw.TextSpan(
                                            text: '\nRegión: ',
                                            style: pw.TextStyle(
                                                fontSize: 16,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.black)),
                                        pw.TextSpan(
                                            text: incidencesModel
                                                .incides[0].region),
                                      ])),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : pw.SizedBox(),
                      pw.SizedBox(height: 10),
                      incidencesModel != null &&
                              incidencesModel.incides.isNotEmpty
                          ? pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              children: [
                                  pw.Container(
                                    width: size.width * 0.2,
                                    height: 150,
                                    decoration: pw.BoxDecoration(
                                        borderRadius:
                                            pw.BorderRadius.circular(15),
                                        border: pw.Border.all(
                                            color: PdfColors.blue)),
                                    padding: const pw.EdgeInsets.all(10),
                                    child: pw.Align(
                                      alignment: pw.Alignment.topLeft,
                                      child: pw.FittedBox(
                                        fit: pw.BoxFit.scaleDown,
                                        child: pw.RichText(
                                            text: pw.TextSpan(children: [
                                          pw.TextSpan(
                                              text: 'Datos del CIST/CARE\n',
                                              style: pw.TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text:
                                                  '\nNombres y apellidos CIST: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].cistNombApell),
                                          pw.TextSpan(
                                              text: '\nTeléfono CIST: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].cistTelefono),
                                          pw.TextSpan(
                                              text: '\nDNI CIST: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].cistDni),
                                          pw.TextSpan(
                                              text: '\nCorreo CIST: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].cistCorreo),
                                        ])),
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                    width: size.width * 0.2,
                                    height: 150,
                                    decoration: pw.BoxDecoration(
                                        borderRadius:
                                            pw.BorderRadius.circular(15),
                                        border: pw.Border.all(
                                            color: PdfColors.blue)),
                                    padding: const pw.EdgeInsets.all(10),
                                    child: pw.Align(
                                      alignment: pw.Alignment.topLeft,
                                      child: pw.FittedBox(
                                        fit: pw.BoxFit.scaleDown,
                                        child: pw.RichText(
                                            text: pw.TextSpan(children: [
                                          pw.TextSpan(
                                              text: 'Datos del director\n',
                                              style: pw.TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text:
                                                  '\nNombres y apellidos director: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].dirNombApell),
                                          pw.TextSpan(
                                              text: '\nTeléfono director: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].dirTelefono),
                                          pw.TextSpan(
                                              text: '\nDNI director: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].dirDni),
                                          pw.TextSpan(
                                              text: '\nCorreo director: ',
                                              style: pw.TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.black)),
                                          pw.TextSpan(
                                              text: incidencesModel
                                                  .incides[0].dirCorreo),
                                        ])),
                                      ),
                                    ),
                                  )
                                ])
                          : pw.SizedBox(),
                      pw.SizedBox(height: 20),
                      pw.Text('Fichas',
                          style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.black)),
                      pw.SizedBox(height: 10),
                      fichasModel != null && fichasModel.fichas.isNotEmpty
                          ? pw.Table.fromTextArray(data: [
                              [
                                'Tipo de incidente',
                                'Marca',
                                'Modelo',
                                'Serie',
                                'Estado',
                                'Ubicacion',
                                'Observaciones'
                              ],
                              ...fichasModel.fichas
                                  .map((e) => [
                                        e.name,
                                        e.marca,
                                        e.modelo,
                                        e.serie,
                                        e.estado,
                                        e.ubicacion,
                                        e.observaciones
                                      ])
                                  .toList()
                            ])
                          : pw.SizedBox()
                    ]));
            return pdf.save();
          });
        });
  }
}
