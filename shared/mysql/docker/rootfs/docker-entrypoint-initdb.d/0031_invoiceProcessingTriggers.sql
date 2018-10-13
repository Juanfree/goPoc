USE `tblox_invoice_processing`;

DELIMITER //

CREATE TRIGGER `afterInsertUploadedInvoiceScanBatches` AFTER INSERT ON `uploaded_invoice_scan_batches`
 FOR EACH ROW BEGIN

        INSERT INTO
            uploaded_invoice_scan_batches_log (

                uploaded_invoice_scan_batch_id,
                filename,
                original_filename,
                company_id,
                environment,
                date,
                user_id,
                user_action,
                source,
                status,
                revision_id,
                revision_hash,
                process_count,
                auto_generated_pdf,
                auto_process_step_1,
                electronic_invoice_scan_batch
            )

            VALUES (

                NEW.uploaded_invoice_scan_batch_id,
                NEW.filename,
                NEW.original_filename,
                NEW.company_id,
                NEW.environment,
                NEW.date,
                NEW.user_id,
                NEW.user_action,
                NEW.source,
                NEW.status,
                NEW.revision_id,
                NEW.revision_hash,
                NEW.process_count,
                NEW.auto_generated_pdf,
                NEW.auto_process_step_1,
                NEW.electronic_invoice_scan_batch
            );
    END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `afterUpdateUploadedInvoiceScanBatches` AFTER UPDATE ON `uploaded_invoice_scan_batches`
 FOR EACH ROW BEGIN

        INSERT INTO
            uploaded_invoice_scan_batches_log (

                uploaded_invoice_scan_batch_id,
                filename,
                original_filename,
                company_id,
                environment,
                date,
                user_id,
                user_action,
                source,
                status,
                revision_id,
                revision_hash,
                process_count,
                auto_generated_pdf,
                auto_process_step_1,
                electronic_invoice_scan_batch
            )

            VALUES (

                NEW.uploaded_invoice_scan_batch_id,
                NEW.filename,
                NEW.original_filename,
                NEW.company_id,
                NEW.environment,
                NEW.date,
                NEW.user_id,
                NEW.user_action,
                NEW.source,
                NEW.status,
                NEW.revision_id,
                NEW.revision_hash,
                NEW.process_count,
                NEW.auto_generated_pdf,
                NEW.auto_process_step_1,
                NEW.electronic_invoice_scan_batch
            );
    END
//
DELIMITER ;
